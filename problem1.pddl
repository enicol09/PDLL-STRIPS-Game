(define (problem problem_name)
    (:domain Packet_1012334)
    (:objects
       ;;countries
          United_Kingdom Canada
       ;;towns
         London Portsmouth Vancouver
       ;; Ports
        Vanc_Port Ports_Port
       ;; Ships
         Vanc_ship Port_ship
       ;; Trucks
          Truck_1 Truck_2 Truck_3 Truck_4 Truck_5 Truck_6
       ;; Trains
          Vanc_Train Lond_Train
       ;; Warehouses
          London_Warehouse Vancouver_Warehouse
       ;; Stations
       London_station Vancouver_station Portsmouth_station
       ;; Carriage
       Carriage_1 Carriage_2 Carriage_3 Carriage_4 Carriage_5 Carriage_6
       ;; Packets
       Packet_1 Packet_2 Packet_3 Packet_4 Packet_5 Packet_6 Packet_7 Packet_8 Packet_9 Packet_10
    )

    (:init
    ;;Countries
    (Country United_Kingdom)
    (Country Canada)

    ;;Towns
        (Town London)
        (Town Vancouver)
        (Town Portsmouth)

    ;;Town at country initialization
        (at London United_Kingdom)
        (at Portsmouth United_Kingdom)
        (at Vancouver Canada)

    ;;locations
         ;;warehouses

        (Storage London_Warehouse)
        (Storage Vancouver_station)

        (Point_Location London_Warehouse )
        (Point_Location Vancouver_Warehouse)

        (at London_Warehouse London)
        (at Vancouver_Warehouse Vancouver)



        ;;ports && ships

        (Boat Port_ship)
        (Boat Vanc_ship)

        (at Port_ship Ports_Port)
        (at Vanc_ship Vanc_Port)

        (Point_Location Ports_Port)
        (Point_Location Vanc_Port)

        (Marina_Port Ports_Port)
        (Marina_Port Vanc_Port)

        (at Ports_Port Portsmouth)
        (at Vanc_Port Vancouver)

        ;;Train_Station
        (Train_Station London_station)
        (Train_Station Portsmouth_station)
        (Train_Station Vancouver_station)

        ;;stations
        (Point_Location London_station)
        (Point_Location Vancouver_station)
        (Point_Location Portsmouth_station)

        (at London_station London)
        (at Portsmouth_station Portsmouth)
        (at Vancouver_station Vancouver)

        ;;Train
        (Train Lond_Train)
        (Train Vanc_Train)

        (at Lond_Train London_station)
        (at Vanc_Train Vancouver_station)


        ;;wagons
         (Carriage Carriage_1)
         (Carriage Carriage_2)
         (Carriage Carriage_3)
         (Carriage Carriage_4)
         (Carriage Carriage_5)
         (Carriage Carriage_6)

         (at Carriage_1 London_station)
         (at Carriage_2 London_station)

         (at Carriage_3 Portsmouth_station)
         (at Carriage_4 Portsmouth_station)

         (at Carriage_5 Vancouver_station)
         (at Carriage_6 Vancouver_station)

       ;;Trucks
       (Vehicle Truck_1)
       (Vehicle Truck_2)
       (Vehicle Truck_3)
       (Vehicle Truck_4)
       (Vehicle Truck_5)
       (Vehicle Truck_6)

       (at Truck_1 London_station)
       (at Truck_2 London_Warehouse)

        (at Truck_3 Portsmouth_station)
        (at Truck_4 Portsmouth_station)

        (at Truck_5 Vancouver_station)
        (at Truck_6 Vancouver_Warehouse)

        ;;packets (10)
        (Packet Packet_1)
        (Packet Packet_2)
        (Packet Packet_3)
        (Packet Packet_4)
        (Packet Packet_5)
        (Packet Packet_6)
        (Packet Packet_7)
        (Packet Packet_8)
        (Packet Packet_9)
        (Packet Packet_10)

        (at Packet_1 London_Warehouse)
        (at Packet_2 London_Warehouse)
        (at Packet_3 London_Warehouse)
        (at Packet_4 Portsmouth_station)
        (at Packet_5 Vanc_Port)
        (at Packet_6 Vancouver_station)
        (at Packet_7 Vancouver_Warehouse)
        (at Packet_8 Vancouver_station)
        (at Packet_9 Portsmouth_station )
        (at Packet_10 Vancouver_Warehouse)

         ;todo: put the initial state's facts and numeric values here
    )

    (:goal
        (and
           (at Packet_1 Vancouver_Warehouse)
           (at Packet_2 Portsmouth_station)
           (at Packet_3 London_station)
           (at Packet_4 Vancouver_Warehouse)
           (at Packet_5 Ports_Port)
           (at Packet_6 Vancouver_Warehouse)
           (at Packet_7 Portsmouth_station)
           (at Packet_8 London_station)
           (at Packet_9 London_station)
           (at Packet_10 Vancouver_station)

        )
    )

)
