<html>
<head>

<%@include file="./base.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

</head>
<body>

<%-- 	<!-- Practice   -->
	<hr>
	<h1>This is JSTL Example</h1>

<!-- 1. out tag -->
<!-- 2. set tag  -->

	<c:set var="i" value="0" scope="application"></c:set>
	<h1>
		<c:out value="${i}"></c:out>
	</h1>

<!-- 3. remove -->

	<c:remove var="i"></c:remove>

	<h1>  <c:out value="${i}"> this is default value</c:out> </h1>
	<hr>
<!-- 4. if : test condition : true => print-->

	<c:if test="${i>23}">
		<h1>yes i > 23 and condition is true</h1>
	</c:if>

<!-- 5. choose, when, otherwise : java switch --> 
	<c:choose>
		<c:when test="${i>0}">
			<h1>This is my first case</h1>
			<h2>${i} is positive </h2>
		</c:when>
		
		<c:when test="${i<0}">
			<h1>This is my second case</h1>
			<h2>${i} is negative number</h2>
		</c:when>
		
		<c:otherwise>
			<h1>Default case...otherwise</h1>
			<h2>the number is zero</h2>
		</c:otherwise>
	</c:choose>
	
<!-- 6. for each tag :for repeating and traversing -->

<c:forEach  var="j" begin="1" end="10">
	<h1>Value of j is <c:out value="${j}"></c:out> </h1>
</c:forEach>

<!-- 7. redirect -->
<!-- 8. url , param -->
<!-- Book -->

 --%>


	<!-- Practice   -->

	<div class="container mt-3">
		<div class="row">

			<div class="col-md-12">

				<h2 class="text-center mb-3">Welcome To Product App</h2>
<hr>
				<!-- <div class="container text-right">
					<a href="add-product" class="btn btn-outline-success">Add
						Product</a>
				</div> -->
				<!-- **************************************************************** -->

				<div class="container mt-3">
					<div class="row">
						<div class="col-md-4 offset-md-1">
							<!-- **************************************************************** -->
							<form action="${pageContext.request.contextPath}/handle-product"
								method="post">

								


								<div class="form-group">
									<label for="name"><b>Product Name </b> </label><input type="text"
										class="form-control" id="name" aria-describedly="emailHelp"
										name="name" placeholder="Enter the product name here">
								</div>
								<div class="form-group">
									<label for="description"><b>Product Description </b> </label>
									<textarea class="form-control" name="description"
										id="description" row="5"
										placeholder="Enter the product description"></textarea>
								</div>
								<div class="form-group">
									<label for="price"><b>Product Price </b> </label><input type="text"
										class="form-control" id="price" name="price"
										placeholder="Enter the product price here">

								</div>
								<div class="container text-center">

									<a href="${pageContext.request.contextPath }/"
										class="btn btn-outline-danger">RESET</a>

									<button type="submit" class="btn btn-primary">Add</button>


									<!-- **************************************************************** -->

								</div>

							</form>
						</div>
					</div>

				</div>

<hr>


				<!-- **************************************************************** -->
				<br>
				<br>

				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Product Name</th>
							<th scope="col">Description</th>
							<th scope="col">Price</th>
							<th scope="col">Action</th>

						</tr>
					</thead>
					<tbody>

						<c:forEach items="${products}" var="p">
							<tr>
								<th scope="row">${p.id}</th>
								<td>${p.name}</td>
								<td>${p.description }</td>
								<td class="font-weight-bold">&#x20B9; ${p.price}</td>
								<td>
									<!-- **************************************************************** -->


									<a href="update/${p.id}"> <i
										class="fa-sharp fa-solid fa-pen-to-square text-primary"
										style="font-size: 25px; margin-right: 20px"></i>
								</a> <!-- **************************************************************** -->

									<a href="delete/${p.id}"><i
										class="fa-sharp fa-solid fa-trash text-danger"
										style="font-size: 25px;"></i></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>

		</div>

	</div>
	<hr>
</body>
</html>
