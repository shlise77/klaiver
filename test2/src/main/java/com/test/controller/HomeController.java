package com.test.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.domain.CategoryVO;
import com.test.domain.JoinOne;
import com.test.domain.PageMaker;
import com.test.domain.SearchCriteria;
import com.test.service.AdminService;
import com.test.service.CategoryService;
import com.test.service.CboardService;
import com.test.service.CountryService;
import com.test.service.FollowService;
import com.test.service.JoinService;
import com.test.service.ScrollBoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	private ScrollBoardService servicescroll;
	@Inject
	private CategoryService service3;
	@Inject
	private FollowService service4;
	@Inject
	private CboardService servicecompany;
	@Inject
	private JoinService service;
	@Inject
	private CategoryService service1;
	@Inject
	private CountryService service2;
	@Inject
	private AdminService admin;
	
	private JoinOne jo;
	
	// 인증번호
	private String authNum = "";
	// 이메일
	private String email = "";
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(CategoryVO vo, Locale locale, HttpServletRequest request, Model model, HttpSession session)
			throws Exception {
		model.addAttribute("list", service1.categoryget(vo));
		return "namepage";
	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String namePost(JoinOne jo, Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String id = jo.getEmail();
		List<JoinOne> one = service.getid(id);
			for (int i = 0; i < one.size(); i++) {
				if (id.equals(one.get(i).getEmail())) {
					response.setCharacterEncoding("EUC-KR");
					PrintWriter writer = response.getWriter();
					writer.println("<script type='text/javascript'>");
					writer.println("alert('이미 가입된 아이디입니다.');");
					writer.println("history.back();");
					writer.println("</script>");
					writer.flush();
					return home(null, null, request, model, null);
				}
			}
			this.jo = jo;
			String password =jo.getPassword();
			String salt =password;
			salt = SHA256Util.generateSalt();
			String newPassword = SHA256Util.getEncrypt(password, salt);
			jo.setPassword(newPassword);
			jo.setSalt(salt);
			return "redirect:./signhap";

	}
	private boolean sendEmail(String email, String authNum)throws Exception {
		String charSet = "utf-8";
		String from ="";
		String to =email;
	    // 구글 계정 프로젝트 끝나고 넣기
		//구글
		String smtp_username ="";
		String smtp_password ="";
		
/*
// 네이버
 		String smtp_username ="";
		String smtp_password ="";
		*/
		//String CONFIGSET ="ConfigSet";
		
		String host ="smtp.gmail.com";
		int port =587; //smpt포트
		String subject ="Klaiver 인증번호 전달";
		String Name ="Kiaver 관리자 입니다.";
		String content ="인증번호["+authNum+"]입니다."
				+ "<br/>문의 사항은"
				+ "developer@klaiver.com <br/>"
				+ "으로 보내 주시기 바랍니다. ";
		System.out.println(from);
		System.out.println(email);
		System.out.println(content);
		
		
		try{
			HtmlEmail emails = new HtmlEmail();
			emails.setDebug(true);
			emails.setCharset(charSet);
			emails.setSSL(true);
			emails.setHostName(host);
			emails.setSmtpPort(port);
			
			emails.setAuthentication(smtp_username, smtp_password);
			emails.setTLS(true);
			emails.addTo(to,charSet);
			emails.setFrom(from, Name, charSet);
			emails.setSubject(subject);
			emails.setHtmlMsg(content);
			emails.send();
			
		}catch (Exception e) {
			System.out.println(e);
		}/*
		
		Properties props = System.getProperties();
    	props.put("mail.transport.protocol", "smtp");
    	props.put("mail.smtp.port", port); 
    	props.put("mail.smtp.ssl.enable", "true");
    	props.put("mail.smtp.auth", "true");

        // Create a Session object to represent a mail session with the specified properties. 
    	Session session = Session.getDefaultInstance(props);

        // Create a message with the specified information. 
        MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(from));
        msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
        msg.setSubject(subject);
        msg.setContent(content,"text/html; charset=UTF-8");
        
        // Add a configuration set header. Comment or delete the 
        // next line if you are not using a configuration set
     //   msg.setHeader("X-SES-CONFIGURATION-SET", CONFIGSET);
            
        // Create a transport.
        Transport transport = session.getTransport();
                    
        // Send the message.
        try
        {
            System.out.println("Sending...");
            
            // Connect to Amazon SES using the SMTP username and password you specified above.
            transport.connect(host, smtp_username, smtp_password);
        	
            // Send the email.
            transport.sendMessage(msg, msg.getAllRecipients());
            System.out.println("Email sent!");
            
            return true;
        }
        catch (Exception ex) {
            System.out.println("The email was not sent.");
            System.out.println("Error message: " + ex.getMessage());
            
            return false;
        }
        finally
        {
            transport.close();
        }
*/
		return false;		
	}

	private String RandomNom() {
		StringBuffer buffer = new StringBuffer();
		for(int i=0; i<=6;i++){
			int n = (int) (Math.random()*10);
			buffer.append(n);
		}
		return buffer.toString();
	}

	//email
	@RequestMapping(value = "/emailsc", method = RequestMethod.POST)
	public @ResponseBody boolean emailsPost(String email, Model model)
			throws Exception {
		this.email = email;
		System.out.println("111111111"+email);
		//String authNum = "";
		  
		authNum = RandomNom();
		  
		return sendEmail(email.toString(), authNum);
	}
	
	//인증번호 비교 메소드
	@RequestMapping(value = "/compareAuthNum", method = RequestMethod.POST)
	public @ResponseBody boolean CompareAuthNumber(String authNum, Model model)
			throws Exception {
		
		if(this.authNum.equals(authNum) == true){
			if(authNum.equals("") == false)
				return true;
		}
		
		return false;
	}
	
	/*
	 * 5page view controller
	 */

	@RequestMapping(value = "/signhap", method = RequestMethod.GET)
	public void signhapGet(Model model) throws Exception {
		
		model.addAttribute("jo", this.jo);

	}

	@RequestMapping(value = "/signhap", method = RequestMethod.POST)
	public String signhapPost(Model model) throws Exception {
		
		 service.insertOne(jo); 
		 

		return "redirect:./";
	}

	@RequestMapping(value = "/home", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginhome(CategoryVO vo, Locale locale, HttpServletRequest request, Model model, HttpSession session)
			throws Exception {
		String id = (String) request.getSession().getAttribute("login");
		/*model.addAttribute("list", service3.categoryget(vo));
		model.addAttribute("followlist", service4.listSearchCriteriasearch(id));
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", id);
		model.addAttribute("followcompanylist", service4.listSearchCriteriaCompany(map));
		model.addAttribute("updatenewpost", servicescroll.updatenewpost(id));
		model.addAttribute("mlist", admin.getlist());*/
		return "/home";
	}

	@RequestMapping(value = "/home/{mc_number}", method = RequestMethod.GET)
	@ResponseBody
	public List<CategoryVO> categoryget(@PathVariable("mc_number") Integer mc_number) throws Exception {

		return service3.smallcate(mc_number);
	}
	@RequestMapping(value = "/companylist", method = RequestMethod.GET)
	public void companylist(@ModelAttribute("cri") SearchCriteria cri,Model model) throws Exception{
		
		if(cri.getKeyword() == null){
			model.addAttribute("companylist",servicecompany.selectcompany());	
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(servicecompany.selectcompanycount());
			model.addAttribute("pageMaker", pageMaker);
		}else{
			model.addAttribute("companylist",servicecompany.selectKeywordcompany(cri));	
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(servicecompany.selectKeywordcompanycount(cri));
			model.addAttribute("pageMaker", pageMaker);
		}
	}

}
