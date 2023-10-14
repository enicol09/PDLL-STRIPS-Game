; Domain description
(define (domain Packet_1012334)
    ;;what requirements we need.
    (:requirements :strips
                   :negative-preconditions
                   :equality)

    (:predicates
        ;;static predicates
        ;;Mesa Mazikis Metaforas.
        (Vehicle ?VE)
        (Boat ?SH)
        (Carriage ?AT_T)
        (Train ?TR)

        ;; Poleis & xores
        (Country ?C)
        (Town ?T)

        ;; Topothesies
        (Train_Station ?TS)
        (Storage ?STOR)
        (Marina_Port ?MP)
        (Point_Location ?PL)

        ;;Packet
        (Packet ?PA)

        ;;helpful functions & dynamic predicates
        (Is_It_Full ?Full)
        (Attach_To_Train ?AT_T)
        (at ?x ?y)
        (inside ?x ?y)
        (Train_At_Port ?x ?y)
        (Carriage_BelongsTo_Train ?x ?y)
    )

   ;;================MOVE ACTIONS ====================

   ;;move train from one location to another
   (:action Train_Move
        :parameters (?TR ?LFROM ?LTO)
        :precondition (and
            (Train ?TR)
            (at ?TR ?LFROM) ;;train is at the location from

            (Point_Location ?LFROM)
            (Point_Location ?LTO)

        )
        :effect (and

            (not (at ?TR ?LFROM)) ;;the location will not be the same
            (at ?TR ?LTO)
        )
    )

   (:action Port_Station_MoveTo ;;movetostation
        :parameters (?PA ?TS ?MP ?T ?C)
        :precondition (and
            (Town ?T)
            (Country ?C)
            (Packet ?PA)
            (Train_Station ?TS)
            (Marina_Port ?MP)
            (Train_At_Port ?TS ?MP)
            (at ?PA ?MP)
            (at ?MP ?T)
            (at ?TS ?T)
            (at ?T ?C)
        )
        :effect (and
            (not (at ?PA ?MP))
            (at ?PA ?TS)
        )
    )

    (:action Port_Station_MoveFrom ;;movefromstation
        :parameters (?PA ?TS ?MP ?T ?C)
        :precondition (and
            (Town ?T)
            (Country ?C)
            (Packet ?PA)
            (Train_Station ?TS)
            (Marina_Port ?MP)
            (Train_At_Port ?TS ?MP)
            (at ?PA ?TS)
            (at ?MP ?T)
            (at ?TS ?T)
            (at ?T ?C)

        )
        :effect (and
            (not (at ?PA ?TS))
            (at ?PA ?MP)
        )
    )
   ;;=============== LOAD ACTIONS ====================

    ;;load the packet to the truck
    (:action Load_Vehicle
        :parameters (?VE ?PA ?T ?PL ?C)
        :precondition (and
            (Packet ?PA)
            (not(Is_It_Full ?VE)) ;;the packet must not be full
            (Vehicle ?VE)
            (Point_Location ?PL) ;;it is a location
            (Town ?T)
            (Country ?C)
            (at ?PL ?T)
            (at ?T ?C)
            (at ?PA ?PL)
            (at ?VE ?PL)

        )
        :effect (and

            (not (at ?PA ?PL))
            (inside ?PA ?VE)
            (Is_It_Full ?VE) ;;the truck now it is going to be full
        )
    )
       ;;loadPacket to the boad
       (:action Load_Boat
        :parameters (?SH ?PA ?T ?PL ?C)
        :precondition (and
            (Marina_Port ?PL)
            (Country ?C)
            (Packet ?PA)
            (Boat ?SH)
            (Town ?T)
            (at ?SH ?PL)
            (at ?PL ?T)
            (at ?T ?C)
            (at ?PA ?PL)

        )
        :effect (and

            (not (at ?PA ?PL))
            (inside ?PA ?SH)

        )
    )

     (:action Load_Carriage
        :parameters (?AT_T ?PA ?PL ?T ?C)
        :precondition (and
            (Packet ?PA)
            (Carriage ?AT_T)
            (Point_Location ?PL)
            (Town ?T)
            (Country ?C)

            (at ?PL ?T)
            (at ?T ?C)
            (at ?PA ?PL)
            (at ?AT_T ?PL)
            (not(Is_It_Full ?AT_T))

        )
        :effect (and
            (Is_It_Full ?AT_T)
            (inside ?PA ?AT_T)
            (not (at ?PA ?PL))
        )
    )
   ;;=============== UNLOAD ACTIONS ====================

    (:action Unload_Vehicle
        :parameters (?VE ?PA ?T ?PL ?C)

        :precondition (and
            (Packet ?PA)
            (Vehicle ?VE)
            (Point_Location ?PL)
            (Town ?T)
            (Country ?C)

            (at ?PL ?T)
            (at ?T ?C)
            (inside ?PA ?VE)
            (at ?VE ?PL)
            (Is_It_Full ?VE)
        )
        :effect (and

            (at ?PA ?PL);; Packet at new Point_Location
            (not (inside ?PA ?VE))
            (not (Is_It_Full ?VE)) ;;is not full anymore
        )
    )


    (:action Unload_Boat
        :parameters (?SH ?PA ?T ?PL ?C)
        :precondition (and
            (Marina_Port ?PL)
            (Country ?C)
            (Packet ?PA)
            (Boat ?SH)
            (Town ?T)
            (at ?SH ?PL)
            (at ?PL ?T)
            (at ?T ?C)
            (inside ?PA ?SH)

        )
        :effect (and
            (at ?PA ?PL)
            (not (inside ?PA ?SH))
        )
    )

    (:action Unload_Carriage
        :parameters (?AT_T ?PA ?PL ?T ?C)
        :precondition (and
            (Packet ?PA)
            (Carriage ?AT_T)
            (Point_Location ?PL)
            (Town ?T)
            (Country ?C)

            (at ?PL ?T)
            (at ?T ?C)
            (inside ?PA ?AT_T)
            (at ?AT_T ?PL)
            (Is_It_Full ?AT_T)
        )
        :effect (and
            (not (Is_It_Full ?AT_T))
            (not (inside ?PA ?AT_T))
            (at ?PA ?PL)
        )
    )
    ;;===================== DRIVE FUNCTIONS ===============
    (:action drive_Vehicle
        :parameters (?VE ?LFROM ?CFROM ?LTO ?CTO ?C)
        :precondition (and
            (Vehicle ?VE)
            (Point_Location ?LFROM)
            (Town ?CFROM)
            (Point_Location ?LTO)
            (Town ?CTO)
            (Country ?C)
            (at ?CFROM ?C)
            (at ?CTO ?C)
            (at ?LFROM ?CFROM)
            (at ?LTO ?CTO)
            (at ?VE ?LFROM)

        )
        :effect (and
            (at ?VE ?LTO)
            (not (at ?VE ?LFROM))
        )
    )



    (:action Drive_Boat
        :parameters (?SH ?LFROM ?CFROM ?LTO ?CTO ?COFROM ?COTO)
        :precondition (and
            (Marina_Port ?LFROM)
            (Marina_Port ?LTO)
            (Country ?COTO)
            (Country ?COFROM)
            (Town ?CFROM)
            (Town ?CTO)
            (Boat ?SH)
            (not (= ?COTO ?COFROM))
            (at ?LFROM ?CFROM)
            (at ?LTO ?CTO)
            (at ?CFROM ?COFROM)
            (at ?CTO ?COTO)
            (at ?SH ?LFROM)
            (at ?SH ?CFROM)
        )
        :effect (and
            (at ?SH ?LTO)
            (at ?SH ?CTO)
            (not (at ?SH ?LFROM))
            (not (at ?SH ?CFROM))
        )
    )

    ;;=================== CARRIAGE FUNCTIONS ===============
   ;;attach the carriage to the train
    (:action AttachCarriage_ToTrain
        :parameters (?AT_T ?TR ?PL ?T ?C)
        :precondition (and
            (Carriage ?AT_T)
            (Point_Location ?PL)
            (Town ?T)
            (Country ?C)
            (Train ?TR)

            (at ?PL ?T)
            (at ?T ?C)
            (not (Attach_To_Train ?AT_T))
            (at ?TR ?PL)
            (at ?AT_T ?PL)

        )
        :effect (and
            (Attach_To_Train ?AT_T)
            (Carriage_BelongsTo_Train ?AT_T ?TR)
            (not (at ?AT_T ?PL))
        )
    )

   ;;dettach carriage from the train
    (:action DettachCarriage_FromTrain
        :parameters (?AT_T ?TR ?PL ?T ?C)
        :precondition (and
            (Carriage ?AT_T)
            (Point_Location ?PL)
            (Town ?T)
            (Country ?C)
            (Train ?TR)
            (at ?PL ?T)
            (at ?T ?C)
            (Attach_To_Train ?AT_T)
            (at ?TR ?PL)
            (Carriage_BelongsTo_Train ?AT_T ?TR)
        )
        :effect (and
            (not (Attach_To_Train ?AT_T))
            (not (Carriage_BelongsTo_Train ?AT_T ?TR))
            (at ?AT_T ?PL)
        )
    )


)
