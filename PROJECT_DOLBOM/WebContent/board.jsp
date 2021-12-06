<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <!-- bootstrap start-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 
    <link rel="stylesheet" href="css/board.css">
</head>
<body>
    <div id="wrap">
        <div class="container--header">
            <header class="header"> 
                <div class="logo"><!-- 고객센터 링크-->
                    <a class="img__link" href="main.jsp"><img src="asset/idolbom1-removeBack.png" alt="logo"></a> <!-- 나중에 메인으로 바꿔야함 -->   
                    <a class="main__link" href="userCenter.jsp">고객센터</a> 
                    <a class="main__link" href="notice?type=frequent">자주 묻는 질문</a>
                </div>
                <!-- 문의사항 링크 이동-->
                <div>
                    <a id="quest__link" href="inqryRgstr.jsp">문의 등록</a>
                </div>

            </header>
        </div>
        <hr>
        <main>
            <div class="copntainer--main">
                <div class="nav">
                    <ul class="procedure">
                        <li><a href="userCenter.jsp">고객센터</a></li>
                        <li>공지사항</li>
                    </ul>
                </div>  

                <section class="subInner">
                    <div class="notice">
                        <div>
                            <p>공지사항</p>
                        </div>
                        <table>

                            <colgroup>
                                <col class="w450">
                                <col class="w15">
                                <col class="w25">
                                <col class="wfree">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>제목</th>
                                    <th>작성자</th>                  
                                    <th>작성일</th>
                                    <th>조회수</th>
                                </tr>
                            </thead>
                            <tbody>
                            
				                <c:if test="${not empty blist }">
							 		<c:forEach var="vo" items="${blist }">
							 			<tr>
											<td class="subject">
											<a href="notice?type=detail&idx=${vo.idx }&cPage=${pvo.nowPage}">${vo.title }</a></td>
											<td class="admin_id">${vo.aId }</td>
											<td class="regDate">${vo.bDate.substring(0,10) }</td>
											<td class="hit">${vo.hit }</td>
										</tr>
							 		</c:forEach>
							    </c:if>
			 
								 <c:if test="${empty blist }">
								 	<tr>
										<td colspan="3">검색된 데이터가 없습니다.</td>
									</tr>
								 </c:if>
                            
                            </tbody>
                            

                            <tfoot>
                    
								<tr>

									<td colspan="3" class="main-paging">
										<ol class="paging clearfix">
										<c:choose><%--[이전으로]에 대한 사용여부 처리 --%>
										<c:when test="${pvo.beginPage == 1 }">
											<li class="disable">이전으로</li>
										</c:when>
										<c:otherwise>
											<li>
												<a href="notice?type=board&cPage=${pvo.beginPage - 1 }">이전으로</a>
											</li>
										</c:otherwise>
										</c:choose>	
										
										<%--블록내에 표시할 페이지 태그 작성(시작페이지~끝페이지) --%>
										<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
										<c:choose>
										<c:when test="${pageNo == pvo.nowPage }">
											<li class="now">${pageNo }</li>
										</c:when>
										<c:otherwise>
											<li><a href="notice?type=board&cPage=${pageNo }">${pageNo }</a></li>
										</c:otherwise>	
										</c:choose>
										</c:forEach>
										
										
										<%--[다음으로]에 대한 사용여부 처리 --%>	
										<c:if test="${pvo.endPage < pvo.totalPage }">					
											<li><a href="notice?type=board&cPage=${pvo.endPage + 1 }">다음으로</a></li>
										</c:if>
										<c:if test="${pvo.endPage >= pvo.totalPage }">					
											<li class="disable">다음으로</li>
										</c:if>
										</ol>
									</td>

								</tr>	
							
							</tfoot>

                        </table>
                    </div>
                </section>

            </div>
        </main>
        

    </div>
</body>
</html>