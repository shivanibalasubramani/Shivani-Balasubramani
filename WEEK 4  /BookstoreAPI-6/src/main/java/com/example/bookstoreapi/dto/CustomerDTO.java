package com.example.bookstoreapi.dto;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class CustomerDTO {
    private Long id;
    private String name;
    private String email;

    @JsonCreator
    public CustomerDTO(@JsonProperty("customer_id") Long id, 
                       @JsonProperty("customer_name") String name, 
                       @JsonProperty("customer_email") String email) {
        this.id = id;
        this.name = name;
        this.email = email;
    }



    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
