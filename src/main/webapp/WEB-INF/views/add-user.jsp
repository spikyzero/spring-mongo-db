<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags" %>

<template:page title="${title}" styles="${['/resources/styles/add-user.css']}">
    <c:if test="${not empty error}">
        <div class="alert alert-danger warn-alert" role="alert">
                ${error}
        </div>
    </c:if>
    <div class="content-wrapper">
        <form action="<c:url value="/users/add"/>" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Email address</label>
                <input type="email" class="form-control" id="email" name="email" aria-describedby="email-help">
                <div id="email-help" class="form-text">We'll never share your email with anyone else.</div>
            </div>
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</template:page>