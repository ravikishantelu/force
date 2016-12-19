public class Add
{
    Integer w,x,y,z;
public Add()
{
z=10;
}
    public Add(integer a,integer b)
    {
    x=a;
    y=b;
    z=x+y;
    }
    public Add(Integer a, Integer b,Integer c)
    {
    x=a;
    y=b;
    w=c;
    z=(x+y)*w;
    }
    public void addition()
    {
    System.debug('Value of z '+z);
    }
}