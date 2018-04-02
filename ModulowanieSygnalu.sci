//Modulacja amplitudowa
//Pobieram sygnał nosny
t=[0:0.001:1-0.001]; //przedział 
u=(rand(1,1000)-(0.5))*(0.5); //zmienna losowa z rozkladu U(-0.5,0.5)
//sygnał nośny
x=sin(2*%pi*10.*t)+2.*sin(2*%pi*16.*t)+0.25*sin(2*%pi*45.*t)+u; 
//sygnał modulujący
y=sin(2*%pi*11.*t)+3.*sin(2*%pi*22.*t)+0.5*sin(2*%pi*44.*t);

//Amplituda sygnału nosnego
AmpNos=(max(x)-min(x))/2;
//Amplituda sygnalu modulujacego
AmpMod=(max(y)-min(y))/2;
//Glebokość modulacji (100%glebokosci)
m=AmpMod/AmpNos;
// Glebokosc 50%
m_2=m*0.5;
//Glebokosc 70%
m_1=m*0.7;
//Sygnlal zmodulowany dla glebokosci 100%
u=y+AmpNos; //ograniczenie gorne sygnalu
v=-u //ograniczenie dolne sygnalu
//Sygnal zmodulowany (dziele x przez amplitude aby uzyskac -1<=x/Amplituda<=1 a nastepnie mnoze przez sygnal modulujacy przesuniety o amplitude sygnalu nosnego aby uzyskac ograniczenie -(y+Amplituda)<=(y+Amplituda)*x<=(y+Amplituda))
z=(AmpNos+y).*((x)./(AmpNos));
subplot(2,2,1)
plot(t,z,t,x,t,u,t,v);
legend('Sygnał zmodulowany','Sygnał nośny')
title('Modulacja amplitudowa o głebokości modulacji 100%')
xlabel('t')
ylabel('x')
//Sygnal zmodulowany dla glebokosci 70%
AmpNos_1=AmpMod/m_1; //dziele amplitude nosna przez nowa wartosc m
AmpMod_1=AmpNos*m_1;
//tym razem dodaje do y nowa amplitude nosna aby glebokosc modulacji sie zwiekszyla
z_1=(AmpNos_1+y).*((x)./(AmpNos));
u_1=y+AmpNos_1;
v_1=-u_1
subplot(2,2,2)
plot(t,z_1,t,x,t,u_1,t,v_1)
legend('Sygnał zmodulowany','Sygnał nośny')
title('Modulacja amplitudowa o głebokości modulacji 70%')
xlabel('t')
ylabel('x')
//Sygnal zmodulowany dla glebokosci 50%
AmpNos_2=AmpMod/m_2;
AmpMod_2=AmpNos*m_2;
z_2=(AmpNos_2+y).*((x)./(AmpNos));
u_2=y+AmpNos_2;
v_2=-u_2
subplot(2,2,3)
plot(t,z_2,t,x,t,u_2,t,v_2)
legend('Sygnał zmodulowany','Sygnał nośny')
title('Modulacja amplitudowa o głebokości modulacji 50%')
xlabel('t')
ylabel('x')
//Modulacja fazy
//p-wyraz wolny (nie moge dodać u  w z_3, ponieważ wygeneruje mi inne zmienne losowe)
p=x-sin(2*%pi*10.*t)+2.*sin(2*%pi*16.*t)+0.25*sin(2*%pi*45.*t);
//sygnal zmodulowany generuje poprzez dodanie funkcji sygnalu modulujacego do fazy sygnalu nosnego
z_3=sin(2*%pi*10.*t+y)+2.*sin(2*%pi*16.*t+y)+0.25*sin(2*%pi*45.*t+y)+p;
am=(max(z_3)-min(z_3))/2 //amplituda sygnalu po zmianie fazy
o=(z_3./am).*AmpNos//unormowuje sygnal aby amplituda sie nie zmienila
subplot(2,2,4)
plot(t,x,t,y,t,o)
legend('Sygnał nośny','Sygnał modulujący','Sygnał zmodulowany')
xlabel('t')
ylabel('x')
title('Modulacja fazy')
