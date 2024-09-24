#pragma once

#ifndef SESSIONSTATE_H
#define SESSIONSTATE_H

#endif // SESSIONSTATE_H

#include<QObject>



class SessionState {
public :
enum sessionState {
    SIGNED_IN, WRONG_PASSWORD, CONNECTION_ERROR
};
sessionState state;
QString message;

};



