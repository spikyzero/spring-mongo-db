<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags" %>

<%@ attribute name="styles" type="java.util.List" %>
<%@ attribute name="title" %>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/master.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/header.css"/>"/>
    <c:forEach var="style" items="${styles}">
        <link rel="stylesheet" type="text/css" href="<c:url value="${style}"/>"/>
    </c:forEach>
    <title>
        <c:choose>
            <c:when test="${not empty title}">
                ${title}
            </c:when>
            <c:otherwise>
                Spring App
            </c:otherwise>
        </c:choose>
    </title>
    <link rel="stylesheet" href="<c:url value="/webjars/bootstrap/5.3.0/css/bootstrap.min.css"/>">
</head>

<body>
<div class="master-wrapper">
    <template:header/>
    <div class="title-wrapper">
        <p class="navbar-brand" id="title-text">
            <c:choose>
                <c:when test="${not empty title}">
                    ${title}
                </c:when>
                <c:otherwise>
                    Spring App
                </c:otherwise>
            </c:choose>
        </p>
    </div>
    <div class="page-wrapper">
        <jsp:doBody/>
    </div>
</div>
<script src="<c:url value="/webjars/bootstrap/5.3.0/js/bootstrap.bundle.min.js"/>"></script>
</body>

</html>
