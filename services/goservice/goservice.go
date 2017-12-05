package main

import (
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func main() {
	r := mux.NewRouter()
	r.HandleFunc("/goservice", getHelloWorld).Methods("GET")
	r.HandleFunc("/goservice", postHelloWorld).Methods("POST")
	log.Fatal(http.ListenAndServe(":8010", r))
}

func getHelloWorld(res http.ResponseWriter, req *http.Request) {
	res.Write([]byte("[GET]: Hello world from Go!"))
}

func postHelloWorld(res http.ResponseWriter, req *http.Request) {
	res.Write([]byte("[POST]: Hello world from Go!"))
}
