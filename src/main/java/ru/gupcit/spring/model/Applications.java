package ru.gupcit.spring.model;

/**
 * Created by zaur on 09.01.17.
 */
public class Applications {
    private int id;
    private String Fio;
    private String Organizations;
    private int Category_id;
    private String Category_name;
    private int System_id;
    private String System_name;
    private String Text;
    private String Phone;

    public Applications() {
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFio() {
        return Fio;
    }

    public void setFio(String fio) {
        Fio = fio;
    }

    public String getOrganizations() {
        return Organizations;
    }

    public void setOrganizations(String organizations) {
        Organizations = organizations;
    }

    public int getCategory_id() {
        return Category_id;
    }

    public void setCategory_id(int category_id) {
        Category_id = category_id;
    }

    public String getCategory_name() {
        return Category_name;
    }

    public void setCategory_name(String category_name) {
        Category_name = category_name;
    }

    public String getSystem_name() {
        return System_name;
    }

    public void setSystem_name(String system_name) {
        System_name = system_name;
    }

    public int getSystem_id() {
        return System_id;
    }

    public void setSystem_id(int system_id) {
        System_id = system_id;
    }

    public String getText() {
        return Text;
    }

    public void setText(String text) {
        Text = text;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String phone) {
        Phone = phone;
    }
}
