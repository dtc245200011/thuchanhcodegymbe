package com.codegym.service.strategy;

import com.codegym.model.Note;
import com.codegym.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NoteDBStrategy implements NoteStrategy {

    @Override
    public void save(Note note) {
        String sql = "INSERT INTO notes (title, content, type_id) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, note.getTitle());
            pstmt.setString(2, note.getContent());
            pstmt.setInt(3, note.getTypeId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Note note) {
        String sql = "UPDATE notes SET title = ?, content = ?, type_id = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, note.getTitle());
            pstmt.setString(2, note.getContent());
            pstmt.setInt(3, note.getTypeId());
            pstmt.setInt(4, note.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM notes WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Note findById(int id) {
        String sql = "SELECT n.*, t.name AS type_name FROM notes n " +
                     "LEFT JOIN note_type t ON n.type_id = t.id WHERE n.id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return new Note(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getInt("type_id"),
                        rs.getString("type_name")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Note> findAll() {
        List<Note> list = new ArrayList<>();
        String sql = "SELECT n.*, t.name AS type_name FROM notes n " +
                     "LEFT JOIN note_type t ON n.type_id = t.id ORDER BY n.id DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                list.add(new Note(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getInt("type_id"),
                        rs.getString("type_name")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Note> search(String keyword) {
        List<Note> list = new ArrayList<>();
        String sql = "SELECT n.*, t.name AS type_name FROM notes n " +
                     "LEFT JOIN note_type t ON n.type_id = t.id " +
                     "WHERE n.title LIKE ? OR n.content LIKE ? ORDER BY n.id DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            String queryKey = "%" + keyword + "%";
            pstmt.setString(1, queryKey);
            pstmt.setString(2, queryKey);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(new Note(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getInt("type_id"),
                        rs.getString("type_name")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
