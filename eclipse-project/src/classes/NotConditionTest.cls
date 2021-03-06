/* ============================================================
 * This code is part of the "apex-lang" open source project available at:
 * 
 *      http://code.google.com/p/apex-lang/
 *
 * This code is licensed under the Apache License, Version 2.0.  You may obtain a 
 * copy of the License at:
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * ============================================================
 */
@IsTest
private class NotConditionTest {
    
    private static testmethod void testNot1(){
        System.assertEquals(
            '(NOT ((name = \'acme\' AND ispartner = true) OR rating = \'Hot\'))',
            new NotCondition()
                .add(
	                new OrCondition()
	                .add(new AndCondition()
	                    .add(new FieldCondition('name ',Operator.EQUALS,'acme'))
	                    .add(new FieldCondition('ispartner',Operator.EQUALS,true)))
	                .add(new FieldCondition('rating',Operator.EQUALS,'Hot')))
                .toSoql()
        );
    }

    private static testmethod void testNot2(){
        System.assertEquals(
            '((NOT (name = \'acme\' AND ispartner = true)) OR rating = \'Hot\')',
            new OrCondition()
                .add(
                    new NotCondition()
	                .add(new AndCondition()
	                    .add(new FieldCondition('name ',Operator.EQUALS,'acme'))
	                    .add(new FieldCondition('ispartner',Operator.EQUALS,true))))
                .add(new FieldCondition('rating',Operator.EQUALS,'Hot'))
                .toSoql()
        );
    }

}
