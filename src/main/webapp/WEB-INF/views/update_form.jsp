<html>
<head>

<%@include file="./base.jsp"%>

<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>

</head>
<body>



	<div class="container mt-3">
		<div class="row">

			<div class="col-md-12">

				<h2 class="text-center mb-3">Welcome To Product App</h2>

				<!-- **************************************************************** -->

				<div class="container mt-3">
					<div class="row">
						<div class="col-md-4 offset-md-1">
							<!-- **************************************************************** -->

							<form action="${pageContext.request.contextPath}/handle-product"
								method="post">




								<input type="text" disabled value="${product.id}" name="id" />






								<div class="form-group">
									<label for="name"> Product Name</label><input type="text"
										class="form-control" id="name" aria-describedly="emailHelp"
										name="name" placeholder="Enter the product name here"
										value="${product.name}">
								</div>
								<div class="form-group">
									<label for="description"> Product Description</label>
									<input class="form-control" name="description"
										id="description" row="5"
										placeholder="Enter the product description" value = "${product.description}"/>
								</div>
								<div class="form-group">
									<label for="price"> Product Price</label><input type="text"
										class="form-control" id="price" name="price"
										placeholder="Enter the product price here"
										value="${product.price}">

								</div>
								<div class="container text-center">

									<a href="${pageContext.request.contextPath }/"
										class="btn btn-outline-danger">Cancel</a>

									<button type="submit" class="btn btn-info">Update</button>


									<!-- **************************************************************** -->

								</div>

							</form>

						</div>
					</div>

				</div>


				<!-- **************************************************************** -->
				<br> <br>
				
				<table class="table table-bordered">
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
</body>
</html>
