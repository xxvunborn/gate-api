## Documentation for Gates
# **Endpoints**


To access all of the end points described below

## USER

## Create user
```
POST    /api/v1/users/signup
```

## **Request**

``` Json
{
	"user":{
		"email": "unborn.system@gmail.com",
		"password": "password",
		"name": "chris"
	}

}
```
## **Response**
```
{
    "id": 2,
    "name": "chris",
    "email": "unborn.system@gmail.com"
}
```

## SESSION

## Create session
```
POST    /api/v1/sessions
```
## **Request**
```
{
	"email": "unborn.system@gmail.com",
	"password": "password"

}
```
## **Response**
```
{
    "token": "Ydd9VJJwUJoi3Cwx1Nvn7Huw"
}
```

## GATE

## List gates
```
GET    /api/v1/gates/
```
## **Response**
```
[
    {
        "id": 2,
        "user_id": 1,
        "name": "casa",
        "location": "maipú"
    }
]
```

## Get specific gate
```
get    /api/v1/gates/:id
```
## **Response**
```
{
    "id": 2,
    "user_id": 1,
    "name": "casa",
    "location": "maipú"
}
```

## Create new gate
```
POST    /api/v1/gates
```
## **Request**
```
{
	"gate":{
		"name": "casa1",
		"location": "maipú"
	}
}
```
## **Response**
```
{
    "id": 3,
    "user_id": 1,
    "name": "casa1",
    "location": "maipú"
}
```


## Update gate
```
PUT    /api/v1/gates/:id
```
## **Request**
```
{
	"gate":{
		"name": "casa1",
		"location": "maipú"
	}
}
```
## **Response**
```
{
    "id": 2,
    "user_id": 1,
    "name": "casa1",
    "location": "maipú"
}
```

## Delete gate (Disable)
```
DELETE    /api/v1/gates/1
```
## **Response**

## KEY

## List keys
```
GET    /api/v1/gates/:gate_id/keys
```
## **Response**
```
[
    {
        "id": 1,
        "gate_id": 2,
        "user_id": 1,
        "name": "casa",
        "token": "pJ3gicQV1hqerBL5ceK1Haie"
    }
]
```

## Get specific key
```
get    /api/v1/gates/:gate_id/keys/:key_id
```
## **Response**
```
[
    {
        "id": 1,
        "gate_id": 2,
        "user_id": 1,
        "name": "casa",
        "token": "pJ3gicQV1hqerBL5ceK1Haie"
    }
]
```

## Create new key
```
POST    /api/v1/gates/:gate_id/keys
```
## **Request**
```
{
	"key":{
		"name": "casa",
		"user_id": 1,
		"expired_at": "10/12/2017"
	}
}
```
## **Response**
```
{
    "id": 3,
    "gate_id": 2,
    "user_id": 1,
    "name": "casa",
    "token": "UimzpNbzdKyY6fZ8JNe5bURF",
    "expired_at": "2017-12-10T00:00:00.000Z"
}
```


## Update key
```
PUT    /api/v1/gates/:gate_id/keys/:key_id
```
## **Request**
```
{
	"key":{
		"name": "casa2",
		"user_id": 1,
		"expired_at": "10/12/2017"
	}
}
```
## **Response**
```
{
    "id": 2,
    "gate_id": 2,
    "user_id": 1,
    "name": "casa2",
    "token": "WXdjG2XAyKCx5Zww7NPP7MiH",
    "expired_at": "2017-12-10T00:00:00.000Z"
}
```

## Delete gate (Disable)
```
DELETE    /api/v1/gates/1
```
## **Response**
```
{
    "id": 2,
    "gate_id": 2,
    "user_id": 1,
    "name": "casa2",
    "token": "WXdjG2XAyKCx5Zww7NPP7MiH",
    "expired_at": "2017-12-10T00:00:00.000Z"
}
```
