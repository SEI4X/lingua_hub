import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../src/models/model.dart';
import 'notes_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum CardsLearnType { newWords, learnedWords, newAndLearnedWords }

class FirebaseNoteRepository implements NoteRepository {
  final String? _userUid;
  final db = FirebaseFirestore.instance;
  late Future<Isar> localDb;
  late final noteCollection =
      db.collection('users').doc(_userUid).collection('notes');

  FirebaseNoteRepository({
    FirebaseAuth? firebaseAuth,
  }) : _userUid = firebaseAuth?.currentUser?.uid ??
            FirebaseAuth.instance.currentUser?.uid;

  Future<Isar> openLocalDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [NoteLocalSchema, NotesCategoryLocalSchema],
        inspector: true,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }

  @override
  Future<void> setupRepository() async {
    localDb = openLocalDB();
    db.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );

    noteCollection
        .snapshots(includeMetadataChanges: true)
        .listen((querySnapshot) {
      for (var change in querySnapshot.docChanges) {
        final source =
            (querySnapshot.metadata.isFromCache) ? "local cache" : "server";
        switch (change.type) {
          case DocumentChangeType.added:
            print("notes added from $source}");
          case DocumentChangeType.modified:
            print("notes modified from $source}");
          case DocumentChangeType.removed:
            print("notes removed from $source}");
        }
      }
    });
  }

  @override
  Future<void> addNote(NoteModel newNote) async {
    var newNoteId = const Uuid().v4();

    var newLocalModel = NoteLocal.fromModel(newNote);
    newLocalModel.serverId = newNoteId;
    final isar = await localDb;
    isar.writeTxnSync(() {
      isar.noteLocals.putSync(newLocalModel);
    });

    // var newNoteId = const Uuid().v4();
    // try {
    //   newNote = newNote.copyWith(id: newNoteId);
    //   await noteCollection.doc(newNote.id).set(newNote.toEntity().toJSON());
    // } catch (e) {
    //   log(e.toString());
    //   rethrow;
    // }
  }

  @override
  Future<void> deleteNote(String noteId) async {
    final isar = await localDb;
    isar.writeTxnSync(() {
      var note =
          isar.noteLocals.filter().serverIdContains(noteId).findFirstSync();
      isar.noteLocals.deleteSync(note?.id ?? 0);
    });

    // try {
    //   await noteCollection.doc(noteId).delete();
    // } catch (e) {
    //   log(e.toString());
    //   rethrow;
    // }
  }

  @override
  Future<void> editeNote(NoteModel editedNote) async {
    final isar = await localDb;
    isar.writeTxnSync(() {
      var note = isar.noteLocals
          .filter()
          .serverIdContains(editedNote.id ?? "")
          .findFirstSync();
      var updatedNote = NoteLocal.fromModel(editedNote);
      updatedNote.id = note?.id ?? Isar.autoIncrement;
      isar.noteLocals.putSync(updatedNote);
    });

    // try {
    //   await noteCollection
    //       .doc(editedNote.id)
    //       .set(editedNote.toEntity().toJSON());
    // } catch (e) {
    //   log(e.toString());
    //   rethrow;
    // }
  }

  @override
  Future<List<NoteModel>> getNotes() async {
    final isar = await localDb;
    final notes = isar.noteLocals.where().findAllSync();
    final List<NoteModel> result = notes.map((note) {
      return NoteModel.fromLocal(note);
    }).toList();
    return result;

    // try {
    //   List<NoteModel> notes = await noteCollection.get().then((value) => value
    //       .docs
    //       .map((note) => NoteModel.fromEntity(NoteEntity.fromJSON(note.data())))
    //       .toList());

    //   return notes;
    // } catch (e) {
    //   log(e.toString());
    //   rethrow;
    // }
  }

  @override
  Future<NoteModel?> getNoteById(String noteId) async {
    final isar = await localDb;
    final note =
        isar.noteLocals.where().serverIdEqualTo(noteId).findFirstSync();
    if (note != null) {
      return NoteModel.fromLocal(note);
    } else {
      return null;
    }

    // try {
    //   List<NoteModel> notes = await noteCollection.get().then((value) => value
    //       .docs
    //       .map((note) => NoteModel.fromEntity(NoteEntity.fromJSON(note.data())))
    //       .toList());

    //   return notes;
    // } catch (e) {
    //   log(e.toString());
    //   rethrow;
    // }
  }

  @override
  Future<List<NoteModel>> getNotesForLearning(
      CardsLearnType type, String categoryId, int count) async {
    final isar = await localDb;
    List<NoteLocal> notes = [];

    if (categoryId.isNotEmpty) {
      switch (type) {
        case CardsLearnType.learnedWords:
          notes = isar.noteLocals
              .where()
              .filter()
              .isLearnedEqualTo(true)
              .categoryIdEqualTo(categoryId)
              .sortByLastLearnDate()
              .limit(count)
              .findAllSync();
        case CardsLearnType.newWords:
          notes = isar.noteLocals
              .filter()
              .isLearnedEqualTo(false)
              .categoryIdEqualTo(categoryId)
              .limit(count)
              .findAllSync();
        case CardsLearnType.newAndLearnedWords:
          notes = isar.noteLocals
              .filter()
              .isLearnedEqualTo(true)
              .categoryIdEqualTo(categoryId)
              .sortByLastLearnDate()
              .limit((count / 3).ceil())
              .findAllSync();
          notes.addAll(
            isar.noteLocals
                .filter()
                .isLearnedEqualTo(false)
                .categoryIdEqualTo(categoryId)
                .limit(count - (count / 3).ceil())
                .findAllSync(),
          );
      }
    } else {
      switch (type) {
        case CardsLearnType.learnedWords:
          notes = isar.noteLocals
              .filter()
              .isLearnedEqualTo(true)
              .sortByLastLearnDate()
              .limit(count)
              .findAllSync();
        case CardsLearnType.newWords:
          notes = isar.noteLocals
              .filter()
              .isLearnedEqualTo(false)
              .limit(count)
              .findAllSync();
        case CardsLearnType.newAndLearnedWords:
          notes = isar.noteLocals
              .filter()
              .isLearnedEqualTo(true)
              .sortByLastLearnDate()
              .limit((count / 3).ceil())
              .findAllSync();
          notes.addAll(
            isar.noteLocals
                .filter()
                .isLearnedEqualTo(false)
                .limit(count - (count / 3).ceil())
                .findAllSync(),
          );
      }
    }

    final List<NoteModel> result = notes.map((note) {
      return NoteModel.fromLocal(note);
    }).toList();
    return result;

    // try {
    //   List<NoteModel> notes = await noteCollection.get().then((value) => value
    //       .docs
    //       .map((note) => NoteModel.fromEntity(NoteEntity.fromJSON(note.data())))
    //       .toList());

    //   return notes;
    // } catch (e) {
    //   log(e.toString());
    //   rethrow;
    // }
  }
}
