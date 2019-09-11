/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.utils;

import entites.Bill;
import java.time.Instant;
import java.util.Date;
import java.util.List;
import static java.util.stream.Collectors.toList;

/**
 *
 * @author Karlo
 */
public final class BillFilterUtil {

    public static List<Bill> filterBillsByUsernameAndShoppingDateBetween(List<Bill> bills, String username, String dateFromString, String dateToString) {
        Date dateFromDate = null;
        Date dateToDate = null;

        if ("".equals(dateFromString)) {
            dateFromDate = new Date("10/10/1970");
        } else {
            dateFromDate = new Date(dateFromString);
        }

        if ("".equals(dateToString)) {
            dateToDate = Date.from(Instant.now());
        } else {
            dateToDate = new Date(dateToString);
        }

        final Date fromDate = dateFromDate;
        final Date toDate = dateToDate;

        if (username != null && !"".equals(username)) {
            bills = bills.stream()
                    .filter(bill -> bill.getUser().getUsername().equals(username))
                    .collect(toList());
        }

        bills = bills.stream()
                .filter(bill -> (bill.getDate().after(fromDate)
                        || bill.getDate().equals(toDate))&& 
                        bill.getDate().before(toDate) 
                        || bill.getDate().equals(fromDate))
                .collect(toList());

        return bills;
    }
}
