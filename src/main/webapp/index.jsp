<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ page import ="com.ecommerce.controller.*"%>
    <%@ page import ="com.ecommerce.model.*"%>
    <%@ page import ="java.sql.*"%>
    <%@ page import ="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home- SaharaTech</title>
<%@ include file="components/common_cs_js.jsp"%>

  <script src="https://kit.fontawesome.com/a035dc1316.js" crossorigin="anonymous"></script>
  <script src="https://kit.fontawesome.com/ecd7f2ff6f.js" crossorigin="anonymous"></script>

<style>
.fixed-footer {
    background: #ff9800;
    padding-top: 60px;
    color: white;
}

.container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
}



.leftitems a i {
    
    text-align: center;
    width: 40px;
    height: 40px;
    line-height: 40px;
    border-radius: 50%;
    background: #2f3239;
    color: #fff;
    transition: all .5s ease;
    font-size: 16px;
}

.leftitems a {
    
   padding-right: 10px;
   
}

.leftitems a i {
    
   padding-right: 10px;
   
}

.subscribe input[type="email"] {
    width: 0px;
    border: 2px solid #9b9b97;
    border-radius: 5px;
    padding: 10px 145px 10px 20px;
    font-size: 4px;
    color: rgba(255, 255, 255, .5);
    transition: all .5s ease;
}

.subscribe button {
    padding: 10px;
    background-color: #b19361;
    color: #fff;
    border: none;
    border-radius: 5px;
    transition: background-color 0.2s, color 0.2s;
}

.fixed-footer p {
    font-size: 20px;
    display: flex;
}

.fixed-footer a {

    color: #b6babf;
    font-size: 25px;
    float: left;
    /* align-items: center; */
}
.centeritems h4 {
    font-size: 18px;
    padding-left: 0px;
    padding-top: 22px;
    padding-right: 2px;
}

.submit-footer:hover {
    background-color: red;
    cursor: pointer;
}

.leftitems  {
    /* margin-right: -20px; */
    margin-top: -50px;
    margin-left: -150px;
    justify-content: space-between;
    padding-right: 5px;
}

.centeritems h4 {
    margin-top: -43px;
    margin-left: -40px;
}

.subscribe h3 {
    margin-top: -43px;
}

.subscribe input[type="email"] {
    margin-right: 0px;
    margin-bottom: 25px;
    width: 10px;
    font-size: 10px;
}
</style>
</head>
<body>
<%@ include file="components/navbar.jsp"%>
    
    <%
         String searchResult=(String)request.getAttribute("enteredText");
         String cat=request.getParameter("category"); 
         ProductDaoImp pdao=new ProductDaoImp();
         CategoryDaoImp cdao1=new CategoryDaoImp();
         List<Product> l1=null;
         List<Category> cl1=cdao1.getAllCategory();        
        
         if(cat==null)
         {
        	 cat="0";
        	 
        	 if(cat.trim().equals("0"))
             {
              	l1 =pdao.getAllProduct();
             }
         }
         
         else if(cat.equals("0"))
         {
        	 l1 =pdao.getAllProduct();
         }
         
         else
         {
        	
             int categoryId=Integer.parseInt(cat.trim());
             l1=pdao.getProductByCategory(categoryId);	 
              
         }
       
    %>
 <section class="slideImg">
        <div class="picture-slide" >
            <img class="sliders" src="images/slider1.jpg" height="400px" style="width:100%">
            <img class="sliders" src="images/ca2.jpg" height="400px" style="width:100%">
            <img class="sliders" src="images/slider3.jpg" height="400px" style="width:100%">
        </div>
    </section>
    <script>
        var myIndex = 0;
        imgslide();

        function imgslide() {
            var i;
            var x = document.getElementsByClassName("sliders");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            myIndex++;
            if (myIndex > x.length) { myIndex = 1 }
            x[myIndex - 1].style.display = "block";
            setTimeout(imgslide, 3000); // Change image every 3 seconds
        }
    </script>


<div class="text-center"><%@ include file="components/message.jsp"%></div>
<div class="container-fluid">

   <!-- show categories -->
   
       <div class="row">
         <div class="col-md-2 " >
             <div class="list-group mt-4">
                 <%
                     int catId=Integer.parseInt(cat);
                 %>
                 <a href="index.jsp?category=0" class="list-group-item list-group-item-action <%if(catId==0){ %> active bg-dark<%} %>" <%if(catId==0){ %> style="border:#000"<%} %> >All Categories</a>
               <%
                    for(Category c: cl1)
                    {    	
               %>      
                         <a href="index.jsp?category=<%=c.getCategoryId() %>" class="list-group-item list-group-item-action <%if(catId==c.getCategoryId()){ %> active bg-dark<%} %>" <%if(catId==c.getCategoryId()){ %> style="border:#000"<%} %>><%=c.getCategoryTitle() %></a>
               <%
                    }
               %>
               </div>
         </div>     
   
   
   
   <!-- ****************************************** -->

   <!-- show products -->
   
   <%
       if(searchResult==null)
       {
   %>
     
     <div class="col-md-10 ">
         
             <div class="row mt-4">
                 <div class="col-md-12 admin">
                     <div class="card-columns hover">
                     
                         <%
                             String stock="Out Of Stock!!!"; 
                             for(Product p:l1)
                             {
                         %>
                        
                         <div class="card">
                              
                             <img src="productImages/<%=p.getProductPhoto() %>" style="max-height:270px;max-width:100%;width:auto;" class="card-img-top rounded mx-auto d-block m-2" alt="img">
                         
                             <div class="card-body">
                                 <h5 class="card-title"><a href="product.jsp?productId=<%=p.getProductId()%>" style="text-decoration: none;color:black;"> <%=p.getProductTitle() %></a></h5>
                                 <p class="card-text"><%=Helper.get10Words(p.getProductDescription()) %></p> 
                             </div>
                             <div class="card-footer text-center">
                                 <p style="font-size:25px"><span class="ml-2"><b>&#8377;<%=Helper.getProductSellingPrice(p.getProductPrice(), p.getProductDiscount()) %>/-</b></span>
                                 <span class="ml-2" style="font-size:20px;color:red"><s>&#8377;<%=p.getProductPrice()%></s></span>
                                  <span class="ml-2" style="font-size:20px;color:green"><%=p.getProductDiscount() %>&#37 off</span>
                                 </p>
                                  <span class="ml-2" style="font-size:20px;">Stock :</span>
                                  <span class="ml-1" style="font-size:20px"><%if(p.getProductQuantity()<1){ %><span style="color:red;"><b><%=stock%></b></span><%} else{ %><%=p.getProductQuantity()%><% } %></span>
                             </div>
                             
                         </div>
                         
                       
                         <%
                             
                             }
                         %>
                     </div>
                 </div>
             </div>
            
         </div>
         
     <%
         } 
   
       else
       {
    	   List<Product> listOfProductFromSearch=new ProductDaoImp().getSearchedProduct(searchResult);
     %>
           <div class="col-md-10">
         
             <div class="row mt-4">
                 <div class="col-md-12">
                     <div class="card-columns">
                     
                         <%
                             String stock="Out Of Stock!!!"; 
                             for(Product p:listOfProductFromSearch)
                             {
                         %>
                         <div class="card p-2"  >
                        
                             <img src="productPhoto/<%=p.getProductPhoto() %>" style="max-height:270px;max-width:100%;width:auto;" class="card-img-top rounded mx-auto d-block m-2" alt="img">
                         
                             <div class="card-body" >
                                <a href="product.jsp?productId=<%=p.getProductId() %>" style="text-decoration: none;color:black;"> <h5 class="card-title" ><%=p.getProductTitle() %></h5></a>
                                 <p class="card-text"><%=Helper.get10Words(p.getProductDescription()) %></p> 
                             </div>
                             <div class="card-footer text-center">
                                 <p style="font-size:25px"><span class="ml-2"><b>&#8377;<%=Helper.getProductSellingPrice(p.getProductPrice(), p.getProductDiscount()) %>/-</b></span>
                                 <span class="ml-2" style="font-size:20px;color:red"><s>&#8377;<%=p.getProductPrice()%></s></span>
                                  <span class="ml-2" style="font-size:20px;color:green"><%=p.getProductDiscount() %>&#37 off</span>
                                 </p>
                                  <span class="ml-2" style="font-size:20px;">Stock :</span>
                                  <span class="ml-1" style="font-size:20px"><%if(p.getProductQuantity()<1){ %><span style="color:red;"><b><%=stock%></b></span><%} else{ %><%=p.getProductQuantity()%><% } %></span>
                             </div>
                            
                         </div>
                         
                       
                         <%
                             
                             }
                         %>
                     </div>
                 </div>
             </div>
            
         </div>
     <%
       }
     %> 
    
         
      <!-- ******* -->
          
    </div>
 </div>
 
  <!-- Footer starts here -->
  <footer class="fixed-footer" style="background-color: RGB(33, 37, 41);">
    <div class="container">
      <div class="leftitems">
        <p><strong>FOLLOW US </strong></p>
        <a href="#"><i class="fa-brands fa-facebook"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
        <a href="#"><i class="fab fa-linkedin-in"></i></a>
      </div>

      <div class="centeritems">
        <h4 text-align="center">&copy;Copyright SAHARATECH<br>Designed By: SAHARATECHGroup</h4>
      </div>

      <div class="subscribe">
        <h3>GET LATEST UPDATES</h3>
        <form>
          <div class="placeholder">
            <input type="email" placeholder="email address">
            <button type="submit" style="background-color: red">SUBSCRIBE</button>
          </div>
        </form>
      </div>
    </div>
  </footer>
</body>
</html>