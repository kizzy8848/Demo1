package com.kzziy;

import java.util.*;
import java.text.SimpleDateFormat;

public class DateTest {
    public static void main(String[] args) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String s=df.format(new Date());// new Date()为获取当前系统时间
        System.out.println(s);
    }
}
