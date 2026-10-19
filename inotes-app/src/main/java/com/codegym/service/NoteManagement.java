package com.codegym.service;

import com.codegym.model.Note;
import com.codegym.service.strategy.NoteDBStrategy;
import com.codegym.service.strategy.NoteStrategy;

import java.util.List;

public class NoteManagement {
    private NoteStrategy strategy;

    public NoteManagement() {
        // Khởi tạo mặc định dùng MySQL Strategy
        this.strategy = new NoteDBStrategy();
    }

    // Setter để thay đổi tầng lưu trữ lúc Runtime (Runtime Pluggable Storage)
    public void setStrategy(NoteStrategy strategy) {
        this.strategy = strategy;
    }

    public NoteStrategy getStrategy() {
        return strategy;
    }

    public List<Note> getAllNotes() {
        return strategy.findAll();
    }

    public List<Note> searchNotes(String keyword) {
        return strategy.search(keyword);
    }

    public void addNote(String title, String content, int typeId) {
        Note note = new Note(title, content, typeId);
        strategy.save(note);
    }

    public void updateNote(int id, String title, String content, int typeId) {
        Note note = new Note(id, title, content, typeId);
        strategy.update(note);
    }

    public void deleteNote(int id) {
        strategy.delete(id);
    }

    public Note getNoteById(int id) {
        return strategy.findById(id);
    }
}
