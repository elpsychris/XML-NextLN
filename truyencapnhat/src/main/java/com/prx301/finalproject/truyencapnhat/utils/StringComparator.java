package com.prx301.finalproject.truyencapnhat.utils;

import java.util.Arrays;
import java.util.regex.Pattern;

public class StringComparator {
    private static String pattern = "[^A-Za-z0-9 ]";
    public static String normalizeString(String target) {
        return target.toLowerCase().replaceAll(pattern,"");
    }
    public static double computeMatching(String a, String b) {
        a = normalizeString(a);
        b = normalizeString(b);

        int n = a.length();

        int m = b.length();
        int dp[][] = new int [n+1][m+1];

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (a.charAt(i) == b.charAt(j)) {
                    dp[i+1][j+1] = dp[i][j] + 1;
                } else {
                    dp[i+1][j+1] = Math.max(dp[i+1][j],dp[i][j+1]);
                }
            }
        }

        return (double)dp[n][m]/Math.min(m, n);
    }
}
