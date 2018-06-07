<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../header.jsp" %>
<%@ include file="../../../aside.jsp" %>
        <h1>Добавление нового занятия</h1>
        <form action="/lesson/addLesson" method="post">
            <label>Имя: </label><input type="text" value="name" name="name"><BR>

            <label>День рождения: </label><input type="text" value="" name="birthday"><BR>

            <label>Адрес: </label><input type="text" value="0" name="address"><BR>

            <input type="submit" value="OK">
        </form>
<%@ include file="../../../footer.jsp" %>