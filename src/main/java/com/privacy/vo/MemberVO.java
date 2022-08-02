package com.privacy.vo;

public class MemberVO {
    private String memId;
    private String memPw;
    private String memSq;
    private String memSa;
    private String memRegDate;
    private String memPwOld;

    @Override
    public String toString() {
        return "MemberVO [memId=" + memId + ", memPw=" + memPw + ", memSq=" + memSq + ", memSa=" + memSa
                + ", memRegDate=" + memRegDate + "]";
    }

    public String getMemId() {
        return memId.trim();
    }

    public void setMemId(String memId) {
        this.memId = memId.trim();
    }

    public String getMemPw() {
        return memPw.trim();
    }

    public void setMemPw(String memPw) {
        this.memPw = memPw.trim();
    }

    public String getMemSq() {
        return memSq.trim();
    }

    public void setMemSq(String memSq) {
        this.memSq = memSq.trim();
    }

    public String getMemSa() {
        return memSa.trim();
    }

    public void setMemSa(String memSa) {
        this.memSa = memSa.trim();
    }

    public String getMemRegDate() {
        return memRegDate;
    }

    public void setMemRegDate(String memRegDate) {
        this.memRegDate = memRegDate;
    }

    public String getMemPwOld() {
        return memPwOld.trim();
    }

    public void setMemPwOld(String memPwOld) {
        this.memPwOld = memPwOld.trim();
    }
}
