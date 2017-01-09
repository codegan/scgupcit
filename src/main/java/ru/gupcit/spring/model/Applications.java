package ru.gupcit.spring.model;

/**
 * Created by zaur on 09.01.17.
 */
public class Applications {
    private int id;
    private String Author;
    private String Category;
    private String System;
    private String Text;

    public Applications() {
    }

    public Applications(int id, String author, String category, String system, String text) {
        this.id = id;
        Author = author;
        Category = category;
        System = system;
        Text = text;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAuthor() {
        return Author;
    }

    public void setAuthor(String author) {
        Author = author;
    }

    public String getCategory() {
        return Category;
    }

    public void setCategory(String category) {
        Category = category;
    }

    public String getSystem() {
        return System;
    }

    public void setSystem(String system) {
        System = system;
    }

    public String getText() {
        return Text;
    }

    public void setText(String text) {
        Text = text;
    }
}
