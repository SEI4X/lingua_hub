import 'dart:developer';
import 'package:uuid/uuid.dart';

import '../src/models/model.dart';
import '../src/entities/entities.dart';
import 'notes_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseNoteRepository implements NoteRepository {
  final String? _userUid;
  late final noteCollection = FirebaseFirestore.instance
      .collection('users')
      .doc(_userUid)
      .collection('notes');

  FirebaseNoteRepository({
    FirebaseAuth? firebaseAuth,
  }) : _userUid = firebaseAuth?.currentUser?.uid ??
            FirebaseAuth.instance.currentUser?.uid;

  @override
  Future<void> addNote(NoteModel newNote) async {
    var newNoteId = const Uuid().v4();
    try {
      newNote = newNote.copyWith(id: newNoteId);
      await noteCollection.doc(newNote.id).set(newNote.toEntity().toJSON());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> deleteNote(String noteId) async {
    try {
      await noteCollection.doc(noteId).delete();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> editeNote(NoteModel editedNote) async {
    try {
      await noteCollection
          .doc(editedNote.id)
          .set(editedNote.toEntity().toJSON());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<NoteModel>> getNotes() async {
    try {
      List<NoteModel> notes = await noteCollection.get().then((value) => value
          .docs
          .map((note) => NoteModel.fromEntity(NoteEntity.fromJSON(note.data())))
          .toList());

      return notes;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
