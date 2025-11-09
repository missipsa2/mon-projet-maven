package org.example;

import org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class CalculatorTest {
    Calculator c=new Calculator();

    @Test
    void test(){
        assertEquals(2,c.somme(1,1));
    }
}
