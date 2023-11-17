<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별책부록 주문페이지</title>
</head>
<body>
	<div>
		<h1>별책부록</h1>
		<hr>
<section>
  <div>
    <div>
      <div class="row">
        <div class="col-lg-8">
          <h3>배송 정보</h3>
          <form action="${request.getContextPath()}/bookShippingConfirm.ok" method="post"
                  name="shippingForm" novalidate="novalidate">
            <div class="col-md-12 form-group p_star">
              <input type="text" class="form-control" id="m_name" name="m_name" placeholder="성명">
            </div>
            <div class="col-md-4 form-group p_star">
              <input type="text" id="m_phone0" name="m_phone0" readonly="readonly" placeholder="010">
            </div>
            <div class="col-md-4 form-group p_star">
              <input type="text" id="m_phone1" name="m_phone1" placeholder="가운데 연락처">
            </div>
            <div class="col-md-4 form-group p_star">
              <input type="text" id="m_phone2" name="m_phone2" placeholder="연락처 마지막 4자리">
            </div>
            <div class="col-md-6 form-group p_star">
              <input type="text" id="m_email" name="m_email" placeholder="이메일">
            </div>
            <div class="col-md-12 form-group p_star">
              <select class="country_select" name="m_country">
                <option value="choose" disabled="disabled">선택하세요</option>
                <option value="한국" selected="selected">한국</option>
                <option value="U.S.A">U.S.A</option>
              </select>
            </div>
            <div class="col-md-12 form-group p_star">
              <input type="text" id="m_postcode" name="m_postcode" placeholder="우편 번호">
            </div>
            <div class="col-md-12 form-group p_star">
              <input type="text" id="m_addr1" name="m_addr1" placeholder="주소">
            </div>
          </form>
        </div>
        <div class="col-lg-4">
          <div>
            <h2>Your Order</h2>
            <ul class="list">
              <li><a href="#">Product <span>Total</span></a></li>
              <c:forEach items="${sessionScope.cartList }" var="cart">
              <li>
                <a href="#">${cart.c_b_name} 
                  <span>x ${cart.c_b_qty}</span> <span>${cart.c_b_price * cart.c_b_qty}</span>
                </a>
              </li>
              </c:forEach>
            </ul>
            <ul class="list list_2">
              <li><a href="#">Subtotal <span>$ ${totalMoney}</span></a></li>
              <li><a href="#">Shipping <span>Flat rate: $0.00</span></a></li>
              <li><a href="#">Total <span>$ ${totalMoney}</span></a></li>
            </ul>
             
            <input type="submit" class="primary-btn" value="결제하기" onclick="javascript:sendShippingForm()"/>
            <input type="button" class="primary-btn" value="이전으로" onclick="javascript:history.back(-1);">
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
	</div>
</body>
</html>