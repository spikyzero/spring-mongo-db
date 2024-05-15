<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags" %>

<template:page title="${title}" styles="${['/resources/styles/home.css']}">
    <div class="content-wrapper">
        <div class="card">
            <img src="<c:url value="/resources/images/users-banner.jpg"/>" class="card-img-top" alt="Users Banner">
            <div class="card-body">
                <h5 class="card-title">Users page</h5>
                <p class="card-text">Place for users management</p>
                <a href="<c:url value="/users"/>" class="btn btn-primary">Open</a>
            </div>
        </div>
    </div>
</template:page>