/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model.cart;

import com.model.item.Item;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Anh Quan
 */
public class Cart {
    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
    private Item getItemById(int id){
        for(Item item: items){
            if(item.getLaptop().getId()==id){
                return item ;
            }
        }
        return null;
    }
    public int getQuantitById(int id){
        return getItemById(id).getQuantity();
    }
    public void addItem(Item item){
        if(getItemById(item.getLaptop().getId()) != null){
            Item cartItem = getItemById(item.getLaptop().getId());
            cartItem.setQuantity(cartItem.getQuantity()+item.getQuantity());
        }else {
            items.add(item);
        }
    }
    public void removeItem(int id){
        if(getItemById(id)!= null){
            items.remove(getItemById(id));
        }
    }
}
