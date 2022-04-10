#include <iostream>

using namespace std;
int F( int x ) {
    if ( x == 1 )
        return 5 ;
    else if ( x == 0 ) 
        return 1 ;
    else if ( x <= 20 ) {
        if ( x <= 10 ) {
            if ( x < 1 ) { // x < 0 
                return -1 ;
            }
            else { // 1 < x <= 10 
                return F(x-2) + F(x-1) ;
            } // else
        } // if
        else { // 10 < x <= 20
           return F(x-2) + F(x-3) ;
        } // else
    } // if
    else { // x > 20
       return 2*x + F( x/5 ) ;
    } // else
} //


int main()
{
    
    for ( int i = -2 ; i < 22 ; i ++ ) { // test from -2 to 21
        cout << i << ": " << F( i ) << endl ;
    } // for
    return 0;
}


