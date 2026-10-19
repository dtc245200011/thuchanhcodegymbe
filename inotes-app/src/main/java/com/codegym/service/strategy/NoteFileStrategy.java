package com.codegym.service.strategy;

import com.codegym.model.Note;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class NoteFileStrategy implements NoteStrategy {
    private static final String FILE_PATH = System.getProperty("user.home") + File.separator + "inotes_data.txt";
    private static final String DELIMITER = "\\|";

    public NoteFileStrategy() {
        File file = new File(FILE_PATH);
        if (!file.exists()) {
            try {
                file.createNewFile();
                // Tạo một số dữ liệu mặc định ban đầu nếu tệp chưa tồn tại
                saveInitialData();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void saveInitialData() {
        List<Note> initialNotes = new ArrayList<>();
        initialNotes.add(new Note(1, "Họp giao ban đầu tuần (Tệp)", "Thảo luận kế hoạch tiến độ lưu File", 2));
        initialNotes.add(new Note(2, "Ôn tập Strategy Pattern (Tệp)", "Đọc tài liệu File IO Java", 3));
        writeAllToFile(initialNotes);
    }

    private String mapTypeName(int typeId) {
        switch (typeId) {
            case 1: return "Cá nhân";
            case 2: return "Công việc";
            case 3: return "Học tập";
            default: return "Khác";
        }
    }

    private List<Note> readAllFromFile() {
        List<Note> notes = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) return notes;

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] parts = line.split(DELIMITER);
                if (parts.length >= 4) {
                    int id = Integer.parseInt(parts[0].trim());
                    String title = parts[1].trim();
                    String content = parts[2].trim().replace("<BR>", "\n");
                    int typeId = Integer.parseInt(parts[3].trim());
                    notes.add(new Note(id, title, content, typeId, mapTypeName(typeId)));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return notes;
    }

    private void writeAllToFile(List<Note> notes) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Note n : notes) {
                String cleanContent = n.getContent() != null ? n.getContent().replace("\n", "<BR>").replace("\r", "") : "";
                String line = n.getId() + "|" + n.getTitle() + "|" + cleanContent + "|" + n.getTypeId();
                bw.write(line);
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void save(Note note) {
        List<Note> notes = readAllFromFile();
        int maxId = 0;
        for (Note n : notes) {
            if (n.getId() > maxId) maxId = n.getId();
        }
        note.setId(maxId + 1);
        note.setTypeName(mapTypeName(note.getTypeId()));
        notes.add(note);
        writeAllToFile(notes);
    }

    @Override
    public void update(Note note) {
        List<Note> notes = readAllFromFile();
        for (int i = 0; i < notes.size(); i++) {
            if (notes.get(i).getId() == note.getId()) {
                note.setTypeName(mapTypeName(note.getTypeId()));
                notes.set(i, note);
                break;
            }
        }
        writeAllToFile(notes);
    }

    @Override
    public boolean delete(int id) {
        List<Note> notes = readAllFromFile();
        boolean removed = notes.removeIf(n -> n.getId() == id);
        if (removed) {
            writeAllToFile(notes);
        }
        return removed;
    }

    @Override
    public Note findById(int id) {
        List<Note> notes = readAllFromFile();
        for (Note n : notes) {
            if (n.getId() == id) return n;
        }
        return null;
    }

    @Override
    public List<Note> findAll() {
        return readAllFromFile();
    }

    @Override
    public List<Note> search(String keyword) {
        List<Note> result = new ArrayList<>();
        if (keyword == null || keyword.trim().isEmpty()) return findAll();
        String lowerKey = keyword.toLowerCase();
        for (Note n : readAllFromFile()) {
            if ((n.getTitle() != null && n.getTitle().toLowerCase().contains(lowerKey)) ||
                (n.getContent() != null && n.getContent().toLowerCase().contains(lowerKey))) {
                result.add(n);
            }
        }
        return result;
    }
}
