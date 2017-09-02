package qa; 

public class Paging { 
 int totalCount; 
 int pageNum; 

 public Paging(int totalCount, int pageNum) { 
  this.totalCount = totalCount; 
  this.pageNum = pageNum; 
 } 

 private int getLastPage() { 
  return getPageCount(); 
 } 

 public int getStartNum(int page) { 
  if(page<1)page = 1; 
  if(page>getLastPage()){ 
   page = getLastPage(); 
  } 
  int start = pageNum * page - pageNum; 
  return start; 
 } 

 public int getEndNum(int page) { 
  if(page<1)page = 1; 
  if(page>getLastPage()){ 
   page = getLastPage(); 
  } 
  int end = pageNum * page; 
  return end; 
 } 

 public int getPageCount() { 
  int t = (totalCount / pageNum); 
  if (totalCount % pageNum > 0) { 
   t++; 
  } 
  return t; 
 } 
}