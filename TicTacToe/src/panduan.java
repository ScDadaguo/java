public class panduan {

    static boolean result(){
        if (JBclick.SC[0][0]==1&&JBclick.SC[1][1]==1&&JBclick.SC[2][2]==1)
            return true;
        else if (JBclick.SC[0][2]==1&&JBclick.SC[1][1]==1&&JBclick.SC[2][0]==1)
            return true;
        else if (JBclick.SC[0][0]==1&&JBclick.SC[0][1]==1&&JBclick.SC[0][2]==1)
            return true;
        else if(JBclick.SC[1][0]==1&&JBclick.SC[1][1]==1&&JBclick.SC[1][2]==1)
            return true;
        else if (JBclick.SC[2][0]==1&&JBclick.SC[2][1]==1&&JBclick.SC[2][2]==1)
            return true;
        else if (JBclick.SC[0][0]==1&&JBclick.SC[1][0]==1&&JBclick.SC[2][0]==1)
            return true;
        else if (JBclick.SC[0][1]==1&&JBclick.SC[1][1]==1&&JBclick.SC[2][1]==1)
            return true;
        else if (JBclick.SC[0][2]==1&&JBclick.SC[1][2]==1&&JBclick.SC[2][2]==1)
            return true;
        else {
            return false;
        }

    }
    static boolean result2(){
        if (JBclick.SC[0][0]==2&&JBclick.SC[1][1]==2&&JBclick.SC[2][2]==2)
            return true;
        else if (JBclick.SC[0][2]==2&&JBclick.SC[1][1]==2&&JBclick.SC[2][0]==2)
            return true;
        else if (JBclick.SC[0][0]==2&&JBclick.SC[0][1]==2&&JBclick.SC[0][2]==2)
            return true;
        else if(JBclick.SC[1][0]==2&&JBclick.SC[1][1]==2&&JBclick.SC[1][2]==2)
            return true;
        else if (JBclick.SC[2][0]==2&&JBclick.SC[2][1]==2&&JBclick.SC[2][2]==2)
            return true;
        else if (JBclick.SC[0][0]==2&&JBclick.SC[1][0]==2&&JBclick.SC[2][0]==2)
            return true;
        else if (JBclick.SC[0][1]==2&&JBclick.SC[1][1]==2&&JBclick.SC[2][1]==2)
            return true;
        else if (JBclick.SC[0][2]==2&&JBclick.SC[1][2]==2&&JBclick.SC[2][2]==2)
            return true;
        else {
            return false;
        }
    }
}

