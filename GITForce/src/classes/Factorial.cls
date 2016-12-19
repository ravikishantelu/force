public class Factorial
{
 
  integer n, fact = 1;
 
  
  public Factorial(Integer a)
    {
    n=a; 
    while(n>0)
    {
    //for(i=1 ; i<=n ; i++)
    fact = fact * n;
    n--;
    }
    System.debug('======> Factorial <======'+fact);
    }
}