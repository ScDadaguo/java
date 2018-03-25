public class text {
    private  String name ;
    String address;
    int number;

    public text(String name, String address, int number) {

        this.address = address;
        this.number = number;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static void main(String[] args) {
        text t=new text("guoaho","sas",2);

        System.out.println(t.name);
    }

}
