<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../header.jsp" %>
<%@ include file="../../../aside.jsp" %>
        <form class="editForm" action="/speciality/addOrUpdateSpeciality" method="post" name="editForm">
            <c:if test="${action=='update'}">
                <input type="hidden" name="id" value="${speciality.id}">
            </c:if>
            <c:if test="${action=='add'}">
                <input type="hidden" name="id" value="0">
            </c:if>
            <input type="hidden" name="action" value="${action}">

                    <c:if test="${action=='update'}">
                        <h2>Редактирование</h2>
                    </c:if>
                    <c:if test="${action=='add'}">
                        <h2>Добавление новогй специальности</h2>
                    </c:if>
            <ul>
                <li>
                    <label for="name">Название:</label>
                    <input type="text" placeholder="Специальность" required
                           value="<c:if test="${action=='update'}">${speciality.name}</c:if>" name="name"/>
                </li>

                <li>
                    <label for="semesterCount">Кол-во семестров:</label>
                    <input type="text" placeholder="семестры" required
                           value="<c:if test="${action=='update'}">${speciality.semesterCount}</c:if>" name="semesterCount"/>
                </li>

                <li>
                    <button class="submit" type="submit">OK</button>
                </li>
            </ul>
        </form>
<%@ include file="../../../footer.jsp" %>