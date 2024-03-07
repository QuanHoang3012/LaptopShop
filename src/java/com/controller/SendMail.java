/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.controller;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author Anh Quan
 */
public class SendMail {

    public void sendMail(String to, String subject, String content, String user, String pass) {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // create Authenticator
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        };

        //Phien lam viec
        Session session = Session.getInstance(properties, authenticator);

        //Sending email
        MimeMessage message = new MimeMessage(session);

        try {
            message.addHeader("Content-type", "text/HTML; charset=UTF-8");
            message.setFrom(new InternetAddress(user));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            message.setSubject(subject, "UTF-8");
            message.setSentDate(new Date());
            //message.setReplyTo(InternetAddress.parse(from, false));
            message.setText(content, "UTF-8");

            Transport.send(message);

        } catch (MessagingException e) {
            System.out.println("SendEmail " + e);
        }
    }

    public static void main(String[] args) {
        SendMail s = new SendMail();
        s.sendMail("hoangquan15012004@gmail.com", "Thông báo xác nhận đặt hàng thành công!", "your order is processing", "quanhahe186591@fpt.edu.vn", "klvp ulsd hbqk jvdk");
    }
}
