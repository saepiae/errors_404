<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../header.jsp" %>
<%@ include file="../../../aside.jsp" %>
        <form class="editForm" action="/person/addOrUpdate" method="post" name="editForm">
            <c:if test="${action=='update'}">
                <input type="hidden" name="id" value="${person.id}">
            </c:if>
            <c:if test="${action=='add'}">
                <input type="hidden" name="id" value="0">
            </c:if>
            <input type="hidden" name="action" value="${action}">

                    <c:if test="${action=='update'}">
                        <h2>Редактирование</h2>
                    </c:if>
                    <c:if test="${action=='add'}">
                        <h2>Добавление нового студента</h2>
                    </c:if>
            <ul>
                <li>
                    <label for="name">Имя:</label>
                    <input type="text" placeholder="Иван Иванов" required
                           value="<c:if test="${action=='update'}">${person.name}</c:if>" name="name"/>
                </li>

                <li>
                    <label for="birthday">День рождения:</label>
                    <input type="text" placeholder="1970-01-01" required
                           value="<c:if test="${action=='update'}">${person.birthday}</c:if>" name="birthday"/>
                </li>

                <li>
                    <label for="email">Email:</label>
                    <input type="email" placeholder="ivan@example.ru" required
                           value="<c:if test="${action=='update'}">${person.email}</c:if>" name="email"/>
                    <span class="form_hint">Proper format "name@something.com"</span>
                </li>
                <li>
                    <label for="role">Роль:</label>
                    <input type="role" required value="<c:if test="${action=='update'}">${person.role}</c:if>"
                           name="role"/>
                </li>
                <li>
                    <button class="submit" type="submit">OK</button>
                </li>
            </ul>
        </form>
<%@ include file="../../../footer.jsp" %>