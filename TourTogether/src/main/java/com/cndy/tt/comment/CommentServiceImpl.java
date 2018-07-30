package com.cndy.tt.comment;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("commentService")
public class CommentServiceImpl implements CommentService {

	@Resource(name="commentDao")
	private CommentDao commentDao;
	
	@Override
	public List<Comment> listService(long board_no) {
		List<Comment> comments = commentDao.list(board_no);
		return comments;
	}

	@Override
	public void insertService(Comment comment) {
		System.out.println("CommentServiceImpl 넘어온 comment : comment_no: "+comment.getComment_no()
		+" refer: "+ comment.getRefer() + " lev : "+ comment.getLev()+ " step: "+ comment.getStep()
		+" comment_content: "+comment.getComment_content());
		
		long refer = comment.getRefer();
		
		if(refer == 0) {		
			/* 댓글일 경우  */			
			commentDao.insert(comment);
		}else {		
			/* 댓댓글일 경우. 넘어온 refer, lev, step은  부모댓글의 값  */
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			// lev 셋팅 : 부모 +1
			int lev = comment.getLev() + 1;
			comment.setLev(lev); 	
			System.out.println("lev: "+lev);
			
			long board_no = comment.getBoard_no();
			/*			map.put("board_no", board_no);
			map.put("lev", lev);
			int countLev = commentDao.countLev(map);
			System.out.println(" countLev: "+ countLev);*/
			
			// step 셋팅
			int step = -1;
			//if(countLev == 0) {	//해당 레벨의 첫 댓글이라면
				step = comment.getStep() +1;	// step: 부모 +1
				comment.setStep(step);
				System.out.println(" step : "+step);
			/*}else {	//해당 레벨에 이미 댓글들이 있다면
				map.clear();
				map.put("board_no", board_no);
				map.put("refer", refer);
				map.put("lev", lev);
				step = commentDao.maxStep(map) + 1;		// step: 최대값  +1
				comment.setStep(step);
				System.out.println(" countLev > 0  step : "+step);
			}		*/
			map.clear();
			map.put("board_no", board_no);
			map.put("refer", refer);
			map.put("step", step);
			commentDao.updateSteps(map); 	// 이후의 댓글들 step 변경
						
			System.out.println("CommentServiceImpl 셋팅된 comment : "
					+" refer: "+ comment.getRefer() + " lev : "+ comment.getLev()+ " step: "+ comment.getStep());
			commentDao.insertReply(comment);
		}
	}
}
