package com.sql;

import java.util.Scanner;

public class Test {
    public static void main(String[] args){

        //实例化对象
        VisitMySql vs = new VisitMySql();
        vs.Connect();
        System.out.println("请选择要进行的操作：\n" +
                "0：停止   " +
                "1：打印   " +
                "2：添加   " +
                "3：删除   " +
                "4:修改    "
                );
        while(true) {
            System.out.print("请输入选项：");
            Scanner input = new Scanner(System.in);
            int number = input.nextInt();
            if (number == 1) {
                vs.Select();
                continue;
            } else if (number == 2) {
                vs.Add();
                continue;
            } else if (number == 3) {
                vs.Delete();
                continue;
            } else if (number == 4) {
                vs.Update();
                continue;
            }
            else if(number==0){
                vs.Close();
                break;
            }
            else {
                System.out.println("输入有误，请重新选择");
            }
        }
    }
}
