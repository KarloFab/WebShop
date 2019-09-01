/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.utils;

import entites.User;

/**
 *
 * @author Karlo
 */
public final class UserUtil {

    public static boolean isUserAdmin(User user) {
        return user.getUserRoles().stream()
                .anyMatch(userRole -> userRole.getRole().getName().equals("Admin"));
    }
}
