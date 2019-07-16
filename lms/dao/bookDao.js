var db = require('./db');

//read all books
exports.getAllBooks = function(cb){
    db.query('select * from lms.tbl_book', cb);
};

//read one book
exports.getExactBook = function(bookId, cb){
  db.query('select * from lms.tbl_book where book_id = ?',[bookId],function(err,res){
    cb(err,res);
  });
}

//add book
exports.addBook = function(book, cb){
    db.beginTransaction(function(err){
        if(err) cb(err, null);
    
        db.query('insert into lms.tbl_book(title, publisher_id) values(?,?)', [book.title, book.publisher_id], function(err, res){
          if(err){
            db.rollback(function(err, res){
              cb(err, res);
            });
          } 
          db.commit(function(err, res){
            cb(err, res);
          });
        });
      });
};

//delete book
exports.removeBook = function(bookId, cb){
    db.beginTransaction(function(err){
        if(err) cb(err, null);
    
        db.query('delete from lms.tbl_book where book_id = ?', [bookId], function(err, res){
          if(err){
            db.rollback(function(err, res){
              cb(err, res);
            });
          } 
          db.commit(function(err, res){
            cb(err, res);
          });
        });
      });
}

//update book
exports.updateBook = function(book,callback){
  db.beginTransaction(function(err){
    if(err){
      callback(err,null);
    };
    db.query("update lms.tbl_book set title = ?, publisher_id = ?",[book.title, book.publisher_id],function(err,res){
      if(err){
        db.rollback(function(err,res){
          callback(err,res);
        });
      }
      db.commit(function(err,res){
        callback(err,res);
      });
    });
  });
}