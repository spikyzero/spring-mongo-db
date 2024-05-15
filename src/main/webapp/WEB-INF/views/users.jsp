<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags" %>

<template:page title="${title}" styles="${['/resources/styles/users.css']}">
    <c:if test="${not empty success}">
        <div class="alert alert-success success-alert" role="alert">
                ${success}
        </div>
    </c:if>
    <div class="content-wrapper">
        <div class="add-user-button-wrapper">
            <a href="<c:url value="/users/add"/>" class="btn btn-success add-user-button">+</a>
        </div>
        <div class="row">
            <c:forEach var="user" items="${users}">
                <div class="card">
                    <img src="<c:url value="/resources/images/user-card-banner.jpg"/>" class="card-img-top"
                         alt="User Card">
                    <div class="card-body">
                        <h5 class="card-title">${user.username}</h5>
                        <p class="card-text">${user.email}</p>
                        <form action="<c:url value="/users/delete"/>" method="post">
                            <input type="hidden" name="userId" value="${user.id}">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</template:page>