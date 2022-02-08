<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ include file = "../include/header.jsp" %>
  <!--게시판만 적용되는 css-->            
        <style>

            .table-striped > tbody > tr {
                background-color: rgba(255, 255, 255)
            }
            .row h2 {
                color: aliceblue;
                
            }
            .pagination-sm {
                margin: 0;
            }
            
        </style>
    <section>
        
        <div class="container">
            <div class="row">
                
                <h2>게시판 목록</h2>
                <table class="table table-striped" style="text-align: center; border: 2px solid #737373">
                    <thead>
                        <tr>
                            <th style="background-color: #9DCAFF; text-align: center;">번호</th>
                            <th style="background-color: #9DCAFF; text-align: center;">제목</th>
                            <th style="background-color: #9DCAFF; text-align: center;">작성자</th>
                            <th style="background-color: #9DCAFF; text-align: center;">작성일</th>
                        </tr>
                    </thead>
                    <c:forEach var="vo" items="${list}" >
                    <tbody>
                        <tr>
                            <td>${vo.bno}</td>
                            <td><a href="content.bbs?bno=${vo.bno}">${vo.title}</a></td>
                            <td>${vo.writer }</td>
                            <td><fmt:formatDate value="${vo.regdate}" pattern = "yyyy-MM-dd HH-mm" /></td>
                        </tr>
                       
                    </tbody>
                    </c:forEach>
                </table>

                <div class="text-center">
                    <ul class="pagination pagination-sm">
                    	<li><a href="#">처음</a></li>
                    	
                        <c:if test="${pageVO.prev }">
							<li><a href="board.bbs?pageNum=${pageVO.startPage - 1 }&amount=${pageVO.amount">prev</a></li>
						</c:if>
                        
                        <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }">
                        <li class="${pageVO.pageNum eq num ? 'active' : '' }">
                        	<a href="board.bbs?pageNum=${num }&amount=${pageVO.amount }">${num }</a>
                        </li>
                        </c:forEach>
                        
                        <c:if test="${pageVO.next }">
							<li><a href="board.bbs?pageNum=${pageVO.endPage + 1 }&amount=${pageVO.amount">next</a></li>
						</c:if>
                        
                        <li><a href="#">마지막</a></li>
                    </ul>
                    <button class="btn btn-info pull-right" onclick="location.href='write.bbs'">글쓰기</button>
                </div>
                
            </div>
        </div>
    </section>
<%@ include file = "../include/footer.jsp" %>
