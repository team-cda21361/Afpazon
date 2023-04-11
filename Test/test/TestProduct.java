package test;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class TestProduct {

	@Test
	void test1() {
		String s ="Bonjour le monde";
		assertEquals("Bonjour le monde", s);
	
	}
	@Test
	void test2() {
		String s ="Bonjour le monde";
		assertEquals("Bonjour le monde", s);
		
	}
	@Test
	void test3() {
		String s ="Bonjour le monde";
		assertEquals("Bonjour sle monde", s);
		
	}


}
