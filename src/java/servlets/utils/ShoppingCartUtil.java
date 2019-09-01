/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.utils;

import entites.ShoppingCart;
import entites.ShoppingCartProduct;
import entites.User;

/**
 *
 * @author Karlo
 */
public final class ShoppingCartUtil {

    public static int getShoppingCartProductsQuantitySum(ShoppingCart shoppingCart) {
        return shoppingCart.getShoppingCartProducts()
                .stream()
                .mapToInt(ShoppingCartProduct::getQuantity).sum();
    }
}
