package com.journaldev.spring.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.journaldev.spring.dao.QuestionDAO;
import com.journaldev.spring.dao.QuestionDAOImpl;
import com.journaldev.spring.dao.userDAO;
import com.journaldev.spring.model.Question;
import com.journaldev.spring.model.User;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

@Controller
public class SearchQuestions {
	
	
	public static String[] stopWordsofwordnet = {
		"without", "see", "unless", "due", "also", "must", "might", "like", "]", "[", "}", "{", "<", ">", "?", "\"", "\\", "/", ")", "(", "will", "may", "can", "much", "every", "the", "in", "other", "this", "the", "many", "any", "an", "or", "for", "in", "an", "an ", "is", "a", "about", "above", "after", "again", "against", "all", "am", "an", "and", "any", "are", "aren’t", "as", "at", "be", "because", "been", "before", "being", "below", "between", "both", "but", "by", "can’t", "cannot", "could",
		"couldn’t", "did", "didn’t", "do", "does", "doesn’t", "doing", "don’t", "down", "during", "each", "few", "for", "from", "further", "had", "hadn’t", "has", "hasn’t", "have", "haven’t", "having",
		"he", "he’d", "he’ll", "he’s", "her", "here", "here’s", "hers", "herself", "him", "himself", "his", "how", "how’s", "i ", " i", "i’d", "i’ll", "i’m", "i’ve", "if", "in", "into", "is",
		"isn’t", "it", "it’s", "its", "itself", "let’s", "me", "more", "most", "mustn’t", "my", "myself", "no", "nor", "not", "of", "off", "on", "once", "only", "ought", "our", "ours", "ourselves",
		"out", "over", "own", "same", "shan’t", "she", "she’d", "she’ll", "she’s", "should", "shouldn’t", "so", "some", "such", "than",
		"that", "that’s", "their", "theirs", "them", "themselves", "then", "there", "there’s", "these", "they", "they’d", "they’ll", "they’re", "they’ve",
		"this", "those", "through", "to", "too", "under", "until", "up", "very", "was", "wasn’t", "we", "we’d", "we’ll", "we’re", "we’ve",
		"were", "weren’t", "what", "what’s", "when", "when’s", "where", "where’s", "which", "while", "who", "who’s", "whom",
		"why", "why’s", "with", "won’t", "would", "wouldn’t", "you", "you’d", "you’ll", "you’re", "you’ve", "your", "yours", "yourself", "yourselves",
		"Without", "See", "Unless", "Due", "Also", "Must", "Might", "Like", "Will", "May", "Can", "Much", "Every", "The", "In", "Other", "This", "The", "Many", "Any", "An", "Or", "For", "In", "An", "An ", "Is", "A", "About", "Above", "After", "Again", "Against", "All", "Am", "An", "And", "Any", "Are", "Aren’t", "As", "At", "Be", "Because", "Been", "Before", "Being", "Below", "Between", "Both", "But", "By", "Can’t", "Cannot", "Could",
		"Couldn’t", "Did", "Didn’t", "Do", "Does", "Doesn’t", "Doing", "Don’t", "Down", "During", "Each", "Few", "For", "From", "Further", "Had", "Hadn’t", "Has", "Hasn’t", "Have", "Haven’t", "Having",
		"He", "He’d", "He’ll", "He’s", "Her", "Here", "Here’s", "Hers", "Herself", "Him", "Himself", "His", "How", "How’s", "I ", " I", "I’d", "I’ll", "I’m", "I’ve", "If", "In", "Into", "Is",
		"Isn’t", "It", "It’s", "Its", "Itself", "Let’s", "Me", "More", "Most", "Mustn’t", "My", "Myself", "No", "Nor", "Not", "Of", "Off", "On", "Once", "Only", "Ought", "Our", "Ours", "Ourselves",
		"Out", "Over", "Own", "Same", "Shan’t", "She", "She’d", "She’ll", "She’s", "Should", "Shouldn’t", "So", "Some", "Such", "Than",
		"That", "That’s", "Their", "Theirs", "Them", "Themselves", "Then", "There", "There’s", "These", "They", "They’d", "They’ll", "They’re", "They’ve",
		"This", "Those", "Through", "To", "Too", "Under", "Until", "Up", "Very", "Was", "Wasn’t", "We", "We’d", "We’ll", "We’re", "We’ve",
		"Were", "Weren’t", "What", "What’s", "When", "When’s", "Where", "Where’s", "Which", "While", "Who", "Who’s", "Whom",
		"Why", "Why’s", "With", "Won’t", "Would", "Wouldn’t", "You", "You’d", "You’ll", "You’re"};
				
	@Autowired
	QuestionService questionService;
	
	@RequestMapping(value = "/question", method = RequestMethod.GET)
	public String question() {

		return "question";

	}

	@RequestMapping(value = "/question", method = RequestMethod.POST)
	public String questionPrint(ModelMap model,HttpServletRequest request) {
		int count=0;
		String question = request.getParameter("topic");
		if(!question.isEmpty())
		{
		question = question.toLowerCase();
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
        ArrayList<String> wordsList = new ArrayList<String>();
        ArrayList<Integer> questionIDList = new ArrayList<Integer>();
        ArrayList<Question> questionList = questionService.getAllQuestions();
       // question = question.trim().replaceAll("\\question+", " ");
        String[] words = question.split(" ");
        String[] sentence = null;
        String quest = null;

        for (String word : words) 
        {
        wordsList.add(word);
        }
        for (int i = 0; i < wordsList.size(); i++) 
        {
        	// get the item as string
        	for (int j = 0; j < stopWordsofwordnet.length; j++) 
        	{
        	  if (stopWordsofwordnet[j].contains(wordsList.get(i))) 
        	  {
        	    wordsList.remove(i);
        	  }
            }
        }
        for (int i = 0; i < wordsList.size(); i++) 
        { 
        	count = 0; 	        	
        	
        	int p=0;
        	int t = questionList.size();
        	while(p < questionList.size())
        	{
        		quest = questionList.get(p).getQquestion();
        		quest = quest.toLowerCase();
        	    if(quest.contains(wordsList.get(i)))
        			{
        		      sentence = quest.split(" ");
        		      for (int k = 0; k < sentence.length; k++) 
        		      {
        		    	 // System.out.println(questionList.get(i).getQtitle());
        		          if (sentence[k].equals(wordsList.get(i))) 
        		          {
        		        	  count++;
        		          }
        	          }
        		      if(map.containsKey(questionList.get(p).getQid()))
        		      {
        		    	  int l = map.get(questionList.get(p).getQid());
        		    	  if(l<count)
        		    	  {
        		    		  map.put(questionList.get(p).getQid(), count);
        		    	  }
        		      }
        		      else
        		    	{
        		    	  map.put(questionList.get(p).getQid(), count);
        		    	}
        			}
        	p++;
        	}
        }
        Set<Entry<Integer, Integer>> set = map.entrySet();
        List<Entry<Integer, Integer>> list = new ArrayList<Entry<Integer, Integer>>(set);
        Collections.sort( list, new Comparator<Map.Entry<Integer, Integer>>()
        {
            public int compare( Map.Entry<Integer, Integer> o1, Map.Entry<Integer, Integer> o2 )
            {
                return (o2.getValue()).compareTo( o1.getValue() );
            }
        } );
        for(Map.Entry<Integer, Integer> entry:list)
        {
        	questionIDList.add(entry.getKey());
        }
        if(questionIDList.size() != 0)
        {
        ArrayList<Question> topQuestion = questionService.getTopQuestions(questionIDList);
        model.addAttribute("topquestion",topQuestion);
        return "searchPage";
        }
        model.addAttribute("Found","No results found");
        return "searchPage";
		

	}
		return "redirect:/home";
	}
	
	
}

