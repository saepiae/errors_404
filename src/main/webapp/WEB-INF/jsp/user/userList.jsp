<%@ page import="org.apache.log4j.Logger" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%! static Logger logger = Logger.getLogger(userList_jsp.class); %>

<%@ include file="../../../header.jsp" %>
<%@ include file="../../../aside.jsp" %>
<% logger.info("JSP: userList.jsp starts");%>
<h1>Список студентов</h1>
<p><b><a href="/person/addOrUpdate">Добавить нового студента</a></b></p>
<div class="table-responsive">
    <table class="table table-striped">
        <thead>
        <tr>
            <th>№</th>
            <th>Имя студента</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="person" items="${personList}">
            <tr>
                <td>${person.id}</td>
                <td><a href="/person/person?id=${person.id}">${person.name}</a></td>
                <td><a href="/person/updatePerson?id=${person.id}">редактировать</a></td>
                <td><a href="/person/deletePerson?id=${person.id}">удалить</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<% logger.info("JSP: userList.jsp stops");%>
<%@ include file="../../../footer.jsp" %>