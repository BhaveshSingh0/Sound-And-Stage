/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Bhavesh Singh
 */

@Entity
@Table
public class Sound {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id ;
    
    private int seat ;
    private int status;
    private String personBooked;
    private String name ;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSeat() {
        return seat;
    }

    public void setSeat(int seat) {
        this.seat = seat;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getPersonBooked() {
        return personBooked;
    }

    public void setPersonBooked(String personBooked) {
        this.personBooked = personBooked;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
