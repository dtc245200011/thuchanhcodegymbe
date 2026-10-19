package com.codegym.controller;

import com.codegym.model.Note;
import com.codegym.service.NoteManagement;
import com.codegym.service.strategy.NoteDBStrategy;
import com.codegym.service.strategy.NoteFileStrategy;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "NoteServlet", urlPatterns = "/notes")
public class NoteServlet extends HttpServlet {
    private NoteManagement noteManagement;

    @Override
    public void init() {
        noteManagement = new NoteManagement();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "create":
                addNote(request, response);
                break;
            case "edit":
                updateNote(request, response);
                break;
            default:
                listNotes(request, response);
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) action = "";

        // Chuyển đổi chiến lược lưu trữ (Strategy Switcher)
        String storageType = request.getParameter("storage");
        if (storageType != null) {
            if ("file".equalsIgnoreCase(storageType)) {
                noteManagement.setStrategy(new NoteFileStrategy());
            } else if ("db".equalsIgnoreCase(storageType)) {
                noteManagement.setStrategy(new NoteDBStrategy());
            }
        }

        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "view":
                viewNote(request, response);
                break;
            case "delete":
                deleteNote(request, response);
                break;
            case "search":
                searchNotes(request, response);
                break;
            default:
                listNotes(request, response);
                break;
        }
    }

    private void listNotes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Note> listNotes = noteManagement.getAllNotes();
        request.setAttribute("listNotes", listNotes);
        request.setAttribute("currentStorage", 
                (noteManagement.getStrategy() instanceof NoteFileStrategy) ? "file" : "db");
        RequestDispatcher dispatcher = request.getRequestDispatcher("note/list.jsp");
        dispatcher.forward(request, response);
    }

    private void searchNotes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<Note> listNotes = noteManagement.searchNotes(keyword);
        request.setAttribute("listNotes", listNotes);
        request.setAttribute("keyword", keyword);
        request.setAttribute("currentStorage", 
                (noteManagement.getStrategy() instanceof NoteFileStrategy) ? "file" : "db");
        RequestDispatcher dispatcher = request.getRequestDispatcher("note/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("note/create.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Note existingNote = noteManagement.getNoteById(id);
        request.setAttribute("note", existingNote);
        RequestDispatcher dispatcher = request.getRequestDispatcher("note/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void viewNote(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Note note = noteManagement.getNoteById(id);
        request.setAttribute("note", note);
        RequestDispatcher dispatcher = request.getRequestDispatcher("note/view.jsp");
        dispatcher.forward(request, response);
    }

    private void addNote(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int typeId = Integer.parseInt(request.getParameter("typeId"));

        noteManagement.addNote(title, content, typeId);
        response.sendRedirect("notes");
    }

    private void updateNote(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int typeId = Integer.parseInt(request.getParameter("typeId"));

        noteManagement.updateNote(id, title, content, typeId);
        response.sendRedirect("notes");
    }

    private void deleteNote(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        noteManagement.deleteNote(id);
        response.sendRedirect("notes");
    }
}
