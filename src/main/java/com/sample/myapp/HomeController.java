package com.sample.myapp;

import java.text.DateFormat;
import java.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		/**
		 * Stack 예제
		 * - 순차적 접근
		 * - 중복 허용
		 */
		Stack<Integer> stk = new Stack<Integer>();

		if (stk.empty()) {
			stk.push(1);
			stk.push(2);
			stk.push(3);
			stk.push(4);
		}
		if(!stk.empty()) {
			if(stk.peek() == 3) stk.pop();
		}
		if(stk.search(3) == -1) System.out.println("3 is poped");


		/**
		 * Map 예제
		 * - 특정값 바로 확인
		 * - 중복 허용 안함
		 */
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("key1", 1);
		hm.put("key2", 2);
		hm.put("key3", 3);

		if(hm.containsKey("key1") && hm.containsValue(1)) System.out.println("YES");
		hm.put("key1", hm.getOrDefault(("key1"), 0) * 10);

		List<String> keyList = new ArrayList<>(hm.keySet());

		// 오름차순으로 키 정렬
		Collections.sort(keyList, new Comparator<String>() {
			@Override
			public int compare(String o1, String o2) {
				int v1 = hm.get(o1);
				int v2 = hm.get(o2);
				return Integer.compare(v1, v2);
			}
		});

		// 내림차순으로 키 정렬
		Collections.sort(keyList, new Comparator<String>() {
			@Override
			public int compare(String o1, String o2) {
				int v1 = hm.get(o1);
				int v2 = hm.get(o2);
				return Integer.compare(v2, v1);
			}
		});

		// 결과
		for (String s: keyList) System.out.println(s + " = " + hm.get(s));


		/**
		 * Set 예제
		 * - 중복 허용 안함
		 * - TreeSet: 정렬 저장
		 * - HashSet: 정렬 저장 X
		 */
		TreeSet<String> ts = new TreeSet<String>();
		ts.add("apple");
		ts.add("core");
		ts.add("banana");
		// 정렬보장
		for(String s : ts) System.out.println("TresSet : "+s);

		HashSet<String> hs = new HashSet<String>(ts);
		// 정렬보장 안됨
		for(String s : hs) System.out.println("HashSet : "+s);

		// 텍스트 길이 짝수면 요소 삭제
		Iterator<String> iterator = hs.iterator();
		while (iterator.hasNext()) {
			String element = iterator.next();
			if(element.length() % 2 == 0) iterator.remove();
		}

		// 결과
		for (String s: hs) System.out.println("result : "+s);


		/**
		 * Heap(Priority Queue) 예제
		 * - 데이터 추가, 삭제 시 정렬 유지
		 * - 중복 허용
		 */




		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
}
