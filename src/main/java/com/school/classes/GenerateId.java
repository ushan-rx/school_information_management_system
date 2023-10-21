package com.school.classes;


// function to generate next id
// must give last stored id and the prefix
// returns next id

public class GenerateId {

    public String generate(String prev, String adj){
        int length = prev.length();
        String id = adj;
        Integer val = Integer.parseInt(prev.split(adj)[1]) + 1;

        for (int i = 0; i < prev.length() - (adj.length() + val.toString().length()) ; i++) {
            id = id.concat("0");
        }
        return id.concat(val.toString());
    }

}
