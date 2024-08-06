package com.example.pojo;

public class Result {
    private Integer code; // 1: success, 0: fail
    private String msg;   // 提示信息
    private Object data;  // 数据

    // 默认构造函数
    public Result() {}

    // 带参构造函数
    public Result(Integer code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    // Getter 和 Setter 方法
    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    // 成功的结果，带数据
    public static Result success(Object data) {
        return new Result(1, "success", data);
    }

    // 成功的结果，无数据
    public static Result success() {
        return new Result(1, "success", null);
    }

    // 错误的结果，带错误信息
    public static Result error(String msg) {
        return new Result(0, msg, null);
    }

    // 错误的结果，无错误信息
    public static Result error() {
        return new Result(0, "error", null);
    }

    @Override
    public String toString() {
        return "Result{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                '}';
    }
}
