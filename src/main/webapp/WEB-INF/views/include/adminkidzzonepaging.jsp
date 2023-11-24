<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
   
  <c:set  var="kz_no"                value="${kz_no}" />
  <c:set  var="startPage"           value="${pds.startPage}" /> 
  <c:set  var="endPage"             value="${pds.endPage}" /> 
  <c:set  var="nowPage"               value="${pds.nowPage}" /> 
  
  <div>
    <table width="500" height="25"  align="center"  >
     <tr>
       <td width="500" height="25"  align="center" >
     
     <!-- 처음/ 이전 -->     
     <c:if test="${ pds.startPage gt 1 }">
       <a href="/KzList?kz_no=${kz_no }&nowPage=1">처음</a>
       <a href="/KzList?kz_no=${kz_no }&nowPage=${pds.startPage - 1}">
       [이전]
       </a>
     </c:if>
     
     <!-- 1 2 3 4 5 6 [7] 8 9 10  -->
    <c:forEach var="pageNumber" begin="${pds.startPage}" end="${pds.endPage}" step="1">
    <c:choose>
        <c:when test="${pageNumber eq pds.nowPage}">
            <strong>${pageNumber}</strong>&nbsp;&nbsp;
        </c:when>
        <c:otherwise>
            <a href="/KzList?kz_no=${kz_no }&nowPage=${pageNumber}">
                ${pageNumber}
            </a>&nbsp;&nbsp;
        </c:otherwise>
    </c:choose>
</c:forEach>
     
     <!-- 다음 / 마지막 -->
     <c:if test="${ pds.nowPage ne endPage }">
       <a href="/KzList?kz_no=${kz_no }&nowPage=${ pds.nowPage + 1 }">
       [다음]
       </a>
       <a href="/KzList?kz_no=${kz_no }&nowPage=${pds.lastPage}">마지막</a>
     </c:if>    
     
      </td>
     </tr>    
    </table>   
  </div>
  
  
  
  
  
  
  
  
  